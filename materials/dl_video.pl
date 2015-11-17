#!/usr/bin/perl
use strict;
use warnings;
use autodie;

use Getopt::Long qw(HelpMessage);
use FindBin;
use YAML qw(Dump Load DumpFile LoadFile);

use Path::Tiny;
use Number::Format qw(format_bytes);

#----------------------------------------------------------#
# GetOpt section
#----------------------------------------------------------#

=head1 NAME

dl_video.pl - download videos and subtitles based on yaml

=head1 SYNOPSIS

    perl dl_video.pl --in <.yml> [options]
      Options:
        --help              brief help message
        --in_file   -i STR  input .yml file's location
        --action    -a STR  update, download, report or merge
        --out       -o STR  basename of output files
        --dir       -d STR  base directory

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
                = `youtube-dl $URL --get-filename --restrict-filenames -o "%(title)s"` );
        print " " x 8 . "$item->{title}\n";

        print " " x 4 . "Get ext\n";
        chomp( $item->{ext}
                = `youtube-dl $URL --get-filename --format bestvideo[ext!=webm]+bestaudio[ext!=webm]/best[ext!=webm] --restrict-filenames -o "%(ext)s"`
        );
        print " " x 8 . "$item->{ext}\n";

        print " " x 4 . "Get resolution\n";
        chomp( $item->{resolution}
                = `youtube-dl $URL --get-filename --format bestvideo[ext!=webm]+bestaudio[ext!=webm]/best[ext!=webm] --restrict-filenames -o "%(resolution)s"`
        );
        print " " x 8 . "$item->{resolution}\n";

        $item->{resolution} =~ /\d+x(\d+)/;
        my $height = $1;
        if ($height < 480) {
            print " " x 8 . "Low resolution video. Change category to LOW/$item->{category}\n";
            if ($item->{category} !~ /LOW\// ) {
                $item->{category} = "LOW/" . $item->{category};
            }
        }

        $item->{file} = path( $item->{category}, $item->{title} . '.' . $item->{ext} )->stringify;
        print " " x 4 . "Full path [$item->{file}]\n";

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
                    print " " x 8 . "$key\n";
                    last;
                }
            }

            $item->{subs} = \%sub_of;
        }
        else {
            warn " " x 8 . "Can't get subs\n";
        }

# `youtube-dl -f bestvideo+bestaudio/best ` just do the job.
#        print " " x 4 . "Get formats\n";
#        my $format_text = `youtube-dl --list-formats $URL`;
#        if ( $format_text
#            =~ m{Available formats for.+format code\s+extension\s+resolution\s+note(.+)$}s )
#        {
#            my @lines = grep {/mp4/} grep { !/(audio|video) only/ } grep {/\w+/} split( /\n/, $1 );
#            my ($best) = grep {/best/} @lines;
#            if ( $best and $best =~ /^(\d+)\s+/ ) {
#                $item->{format} = $1;
#                print " " x 8 . "Get best format [$item->{format}]\n";
#            }
#            else {
#                my %res_of;
#                for my $line (@lines) {
#                    my @fields = split /\s+/, $line;
#                    next unless $fields[0];
#                    next unless $fields[2];
#                    next unless $fields[2] =~ /\d+x(\d+)/;
#                    $res_of{ $fields[0] } = $fields[2];
#                }
#                if ( scalar keys %res_of ) {
#                    my ($largest) = sort { $res_of{$b} <=> $res_of{$a} } keys %res_of;
#                    $item->{format} = $largest;
#                    print " " x 8 . "Get best resolution [$largest] [$res_of{$largest}]\n";
#                }
#                else {
#                    warn " " x 8 . "Can't find best formats\n";
#                }
#            }
#        }
#        else {
#            warn " " x 8 . "Can't get formats\n";
#        }

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
        $bash_file->append("# $item->{category}\n");
        $bash_file->append("# $item->{original_title}\n");

        $bash_file->append(
            "youtube-dl $item->{URL} --format bestvideo[ext!=webm]+bestaudio[ext!=webm]/best[ext!=webm] --restrict-filenames -o '$video_file'\n"
        );
        for my $key ( keys %{ $item->{subs} } ) {
            $bash_file->append(
                "youtube-dl $item->{URL} --restrict-filenames -o '$video_file' --write-sub --sub-lang $key --skip-download\n"
            );
        }
        $bash_file->append("\n");
    }

    print "\n";
}
elsif ( $action eq "report" ) {
    print "====> Do action $action <====\n\n";

    my $yml = LoadFile($in_file);

    $base_dir = path($base_dir)->absolute;
    print "Base dir is $base_dir\n";

    my $report_file = path( $base_dir, "$out.report.csv" );
    print "Output report file is $report_file\n";
    $report_file->remove;

    # csv header line
    $report_file->append("category,title,resolution,size,duration\n");

    for my $item ( @{$yml} ) {
        my $video_file = path( $base_dir, $item->{file} );
        print " " x 4, "Collect reports for $item->{title}\n";

        $report_file->append("'$item->{category}','$item->{title}',");
        chomp( my $width
                = `ffprobe -v error -show_entries stream=width -of default=noprint_wrappers=1:nokey=1 $video_file`
        );
        chomp( my $height
                = `ffprobe -v error -show_entries stream=height -of default=noprint_wrappers=1:nokey=1 $video_file`
        );
        chomp( my $size
                = `ffprobe -v error -show_entries format=size -of default=noprint_wrappers=1:nokey=1 $video_file`
        );
        chomp( my $duration
                = `ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 -sexagesimal $video_file`
        );
        $size = format_bytes($size);
        $duration =~ s/\.\d+//;
        $report_file->append("${width}x${height},$size,$duration\n");
    }

    print "\n";
}
elsif ( $action eq "merge" ) {
    print "====> Do action $action <====\n\n";

    my $yml = LoadFile($in_file);

    $base_dir = path($base_dir)->absolute;
    print "Base dir is $base_dir\n";

    my $bash_file = path( $base_dir, "$out.merge.sh" );
    print "Output bash file is $bash_file\n";
    $bash_file->remove;
    $bash_file->append("#!/bin/bash\n\n");

    for my $item ( @{$yml} ) {
        my $video_file = path( $base_dir, $item->{file} );
        $bash_file->append("# $item->{category}\n");
        $bash_file->append("# $item->{original_title}\n");

        # cat srt files into one
        $bash_file->append("cat ");
        if ( exists $item->{subs}{en} ) {
            $bash_file->append( $item->{subs}{en} . " " );
        }
        for my $key ( grep { $_ ne 'en' } keys %{ $item->{subs} } ) {
            $bash_file->append( $item->{subs}{$key} . " " );
        }
        $bash_file->append(" > merged.srt.tmp \n");

        # ffmpeg
        $bash_file->append(
            "ffmpeg -i $video_file -vf subtitles='merged.srt.tmp' -c:v libx264 -crf 20 -c:a copy embed/$item->{title}.mp4\n"
        );

        # remove tmp file
        $bash_file->append("rm merged.srt.tmp\n");
        $bash_file->append("\n");
    }

    print "\n";
}
else {
    die "Undefined action [-a $action]\n";
}

exit;
