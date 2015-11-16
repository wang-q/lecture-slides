#!/usr/bin/perl
use strict;
use warnings;
use autodie;

use Getopt::Long qw(HelpMessage);
use FindBin;
use YAML qw(Dump Load DumpFile LoadFile);

use Path::Tiny;

#----------------------------------------------------------#
# GetOpt section
#----------------------------------------------------------#

=head1 NAME

dl_video.pl - download videos and subtitles based on yaml

=head1 SYNOPSIS

    perl dl_video.pl --in <.yml> [options]
      Options:
        --help              brief help message
        -i, --in_file       input .yml file's location
        -a, --action        update, download or merge
        -o, --out           basename of output files
        -d, --dir           base directory

=cut

GetOptions(
    'help|?' => sub { HelpMessage(0) },
    'in_file|i=s' => \( my $in_file = path( $FindBin::RealBin, "TED.yml" )->absolute->stringify ),
    'action|a=s'  => \( my $action  = "update" ),
    'out|o=s'     => \my $out,
    'dir|d=s' => \( my $base_dir = path('~/Document/Course')->absolute->stringify ),
) or HelpMessage(1);

#----------------------------------------------------------#
# actions
#----------------------------------------------------------#
$out = 'output' unless $out;

if ( $action eq "update" ) {
    print "====> Do action $action <====\n\n";

    my $yml = LoadFile($in_file);
    $yml = [
        sort { $a->{category} cmp $b->{category} }
        sort { $a->{original_title} cmp $b->{original_title} } @{$yml}
    ];
    DumpFile( $in_file, $yml );

    for my $item ( @{$yml} ) {
        my $URL = $item->{URL};
        next unless defined $URL;

        print "==> Process URL [$URL]\n";

        print " " x 4 . "Get original_title\n";
        chomp( $item->{original_title} = `youtube-dl --get-title $URL` );
        print " " x 8 . "$item->{original_title}\n";

        print " " x 4 . "Get title\n";
        chomp( $item->{title}
                = `youtube-dl --get-filename $URL --restrict-filenames -o "%(title)s"` );
        print " " x 8 . "$item->{title}\n";

        print " " x 4 . "Get ext\n";
        chomp( $item->{ext} = `youtube-dl --get-filename $URL --restrict-filenames -o "%(ext)s"` );
        print " " x 8 . "$item->{ext}\n";

        $item->{file} = path( $item->{category}, $item->{title} . '.' . $item->{ext} )->stringify;

        print " " x 4 . "Get subs\n";
        my $sub_text = `youtube-dl --list-subs $URL`;
        if ( $sub_text =~ m{Available subtitles.+Language formats(.+)$}s ) {
            my @lines = grep {/srt/} grep {/^(:?en|zh)/} grep {/\w+/} split( /\n/, $1 );
            my %seen = map { ( split /\s+/ )[0] => 1 } @lines;
            my %sub_of;

            # always keep the en subtitles
            if ( $seen{en} ) {
                $sub_of{en} = path( $item->{category}, $item->{title} . ".en.srt" )->stringify;
                print " " x 8 . "en\n";

            }

            # get the best Chinese subtitles
            for my $key (qw{zh-CN zh-Hans zh-TW zh-Hant}) {
                if ( $seen{$key} ) {
                    $sub_of{$key}
                        = path( $item->{category}, $item->{title} . ".$key.srt" )->stringify;
                    printf " " x 8 . "$key\n";
                    last;
                }
            }

            $item->{subs} = \%sub_of;
        }
        else {
            warn " " x 8 . "Can't get subs\n";
        }

        print "\n";
    }

    my $out_file = "$out.yml";
    DumpFile( $out_file, $yml );
}
elsif ( $action eq "download" ) {
    print "====> Do action $action <====\n\n";

    my $yml = LoadFile($in_file);

    $base_dir = path($base_dir)->absolute;
    print "Base dir is $base_dir\n";

    my $bash_file = path( $base_dir, "$out.download.sh" );
    print "Output bash file is $bash_file\n";

    $bash_file->remove;
    $bash_file->append("#!/bin/bash\n\n");

    for my $item ( @{$yml} ) {
        my $video_file = path( $base_dir, $item->{file} );
        $bash_file->append("# $item->{original_title}\n");
        $bash_file->append("youtube-dl $item->{URL} --restrict-filenames -o '$video_file'\n");
        for my $key ( keys %{ $item->{subs} } ) {
            $bash_file->append(
                "youtube-dl $item->{URL} --restrict-filenames -o '$video_file' --write-sub --sub-lang $key --skip-download\n"
            );
        }
        $bash_file->append("\n");
    }

    print "\n";
}
elsif ( $action eq "merge" ) {
    print "====> Do action $action <====\n\n";

}
else {
    die "Undefined action [-a $action]\n";
}

exit;
