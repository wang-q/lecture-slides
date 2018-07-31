#!/usr/bin/perl
use strict;
use warnings;
use autodie;

use Getopt::Long;
use FindBin;
use YAML qw(Dump Load DumpFile LoadFile);

use Path::Tiny;
use Number::Format qw(format_bytes);
use Template;

#----------------------------------------------------------#
# GetOpt section
#----------------------------------------------------------#

=head1 NAME

dl_video.pl - download videos and subtitles based on yaml

=head1 SYNOPSIS

    perl dl_video.pl --in <.yml> [options]
      Options:
        --help              brief help message
        --action    -a STR  update, download, report, or burn
        --dir       -d STR  base directory
        --in        -i STR  input .yml file's location
        --out       -o STR  basename of output files
        --proxy     -p STR  proxy for youtube-dl

=cut

GetOptions(
    'help|?' => sub { Getopt::Long::HelpMessage(0) },
    'action|a=s' => \( my $action   = "update" ),
    'dir|d=s'    => \( my $base_dir = path('~/Document/Course')->absolute->stringify ),
    'in|i=s'     => \( my $in_file  = path( $FindBin::RealBin, "TED.yml" )->absolute->stringify ),
    'out|o=s'   => \( my $out ),
    'proxy|p=s' => \( my $proxy ),
) or Getopt::Long::HelpMessage(1);

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

    my $YTDL = 'youtube-dl';
    $YTDL .= " --proxy $proxy" if $proxy;

    for my $item ( @{$yml} ) {
        my $URL = $item->{URL};
        next unless defined $URL;

        print "==> Process URL [$URL]\n";

        print " " x 4 . "Get original_title\n";
        chomp( $item->{original_title} = `$YTDL --get-title $URL` );
        print " " x 8 . "$item->{original_title}\n";

        print " " x 4 . "Get title\n";
        chomp( $item->{title} = `$YTDL $URL --get-filename --restrict-filenames -o "%(title)s"` );
        print " " x 8 . "$item->{title}\n";

        print " " x 4 . "Get ext\n";
        chomp( $item->{ext}
                = `$YTDL $URL --get-filename --format bestvideo[ext!=webm]+bestaudio[ext!=webm]/best[ext!=webm] --restrict-filenames -o "%(ext)s"`
        );
        print " " x 8 . "$item->{ext}\n";

        print " " x 4 . "Get resolution\n";
        chomp( $item->{resolution}
                = `$YTDL $URL --get-filename --format bestvideo[ext!=webm]+bestaudio[ext!=webm]/best[ext!=webm] --restrict-filenames -o "%(resolution)s"`
        );
        print " " x 8 . "$item->{resolution}\n";

        $item->{resolution} =~ /(\d+)x(\d+)/;
        $item->{width}  = $1;
        $item->{height} = $2;
        if ( $item->{height} < 480 ) {
            print " " x 8 . "Low resolution video.\n";
        }

        $item->{file} = path( $item->{category}, $item->{title} . '.' . $item->{ext} )->stringify;
        print " " x 4 . "Full path [$item->{file}]\n";

        if ( exists $item->{subs} ) {
            print " " x 4 . "Use existing subs\n";
        }
        else {
            print " " x 4 . "Get subs\n";

            # Can't use youtube-dl to convert subtitles from vtt to srt with --skip-download.
            # Postprocessors only run after download happens.
            # https://github.com/rg3/youtube-dl/issues/8415
            my $sub_text = `$YTDL --list-subs $URL`;
            if ( $sub_text =~ m{Available subtitles.+Language formats(.+)$}s ) {
                my @lines = grep {/srt|ass|vtt|ttml/}
                    grep {/^(:?en|zh)/} grep {/\w+/} split( /\n/, $1 );
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
    $base_dir->mkpath;
    print "Base dir is $base_dir\n";

    my $bash_file = path( $base_dir, "$out.$action.sh" );
    print "Output bash file is $bash_file\n";

    for my $item ( @{$yml} ) {
        my $video_file = path( $base_dir, $item->{file} );
        $video_file->parent->mkpath;
        $item->{video_file} = path($video_file)->stringify;
    }

    my $text = <<'EOF';
#!/bin/bash

[% FOREACH item IN data -%]
# [% item.category %]
# [% item.original_title %]
# [% item.resolution %]
youtube-dl \
    [% item.URL %] \
    --format bestvideo[ext!=webm]+bestaudio[ext!=webm]/best[ext!=webm] \
    --restrict-filenames --continue --ignore-errors --no-call-home \
[% IF proxy -%]
    --proxy [% proxy %] \
[% END -%]
[% IF item.subs -%]
    --write-sub --convert-subs srt --sub-lang [% FOREACH key IN item.subs.keys.sort %][% key %],[% END %] \
[% END -%]
    -o '[% item.video_file %]'

[% END -%]

EOF

    my $tt = Template->new;
    $tt->process( \$text, { data => $yml, proxy => $proxy, }, $bash_file->stringify )
        or die Template->error;

    print "\n";
}
elsif ( $action eq "report" ) {
    print "====> Do action $action <====\n\n";

    my $yml = LoadFile($in_file);

    $base_dir = path($base_dir)->absolute;
    $base_dir->mkpath;
    print "Base dir is $base_dir\n";

    my $report_file = path( $base_dir, "$out.$action.csv" );
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
        $size = Number::Format::format_bytes($size);
        $duration =~ s/\.\d+//;
        $report_file->append("${width}x${height},$size,$duration\n");
    }

    print "\n";
}
elsif ( $action eq "burn" ) {
    print "====> Do action $action <====\n\n";

    my $yml = LoadFile($in_file);

    $base_dir = path($base_dir)->absolute;
    $base_dir->mkpath;
    print "Base dir is $base_dir\n";

    my $bash_file = path( $base_dir, "$out.$action.sh" );
    print "Output bash file is $bash_file\n";

    for my $item ( @{$yml} ) {
        my $video_file = path( $base_dir, $item->{file} );
        my $new_file
            = path( $base_dir, $action, $item->{category},
            $video_file->basename( ".mp4", ".webm", ".3gp", "flv" ) );
        $new_file->parent->mkpath;

        # Gather sub files and append subtitle abbrs to $new_file
        $item->{sub_files} = [];
        if ( exists $item->{subs}{en} ) {
            $new_file .= ".en";
            push @{ $item->{sub_files} }, path( $base_dir, $item->{subs}{en} )->stringify;
        }
        for my $key ( grep { $_ ne 'en' } keys %{ $item->{subs} } ) {
            $new_file .= ".$key";
            push @{ $item->{sub_files} }, path( $base_dir, $item->{subs}{$key} )->stringify;
        }
        $new_file .= ".$item->{ext}";

        $item->{video_file} = path($video_file)->stringify;
        $item->{new_file}   = path($new_file)->stringify;
    }

    # If height < 480p, scale up to 480p.
    # If height > 720p, scale down to 720p.
    # If there're subtitles, burn them into videos.
    my $text = <<'EOF';
#!/bin/bash

[% FOREACH item IN data -%]
# [% item.category %]
# [% item.original_title %]
# [% item.width %]x[% item.height %]
[% IF item.sub_files.size > 0 -%]
if [ -f [% item.new_file %] ]; then
    echo [% item.new_file %] exists!;
else
    cat \
[% FOREACH sub_file IN item.sub_files -%]
        [% sub_file %] \
[% END -%]
        > merged.srt.tmp

[% IF item.height < 480 -%]
    ffmpeg \
        -i [% item.video_file %] \
        -vf "scale=trunc(oh*a/2)*2:480" \
        -c:v libx264 -crf 20 \
        -c:a libfdk_aac -b:a 128k \
        scaled.tmp.mp4

    ffmpeg \
        -i scaled.tmp.mp4 \
        -vf "subtitles='merged.srt.tmp':force_style='FontName=PingFangSC-Regular,FontSize=18'" \
        -c:v libx264 -crf 20 \
        -c:a copy \
        [% item.new_file %]

    rm scaled.tmp.mp4
[% ELSIF item.height > 720 -%]
    ffmpeg \
        -i [% item.video_file %] \
        -vf "scale=trunc(oh*a/2)*2:720" \
        -c:v libx264 -crf 20 \
        -c:a libfdk_aac -b:a 128k \
        scaled.tmp.mp4

    ffmpeg \
        -i scaled.tmp.mp4 \
        -vf "subtitles='merged.srt.tmp':force_style='FontName=PingFangSC-Regular,FontSize=18'" \
        -c:v libx264 -crf 20 \
        -c:a copy \
        [% item.new_file %]

    rm scaled.tmp.mp4
[% ELSE -%]
    ffmpeg \
        -i [% item.video_file %] \
        -vf "subtitles='merged.srt.tmp':force_style='FontName=PingFangSC-Regular,FontSize=18'" \
        -c:v libx264 -crf 20 \
        -c:a libfdk_aac -b:a 128k \
        [% item.new_file %]
[% END -%]

    rm merged.srt.tmp
fi

[% ELSE -%]
echo No subs for [% item.video_file %]
if [ -f [% item.new_file %] ]; then
    echo [% item.new_file %] exists!;
else
    ffmpeg \
        -i [% item.video_file %] \
[% IF item.height < 480 -%]
        -vf "scale=trunc(oh*a/2)*2:480" \
[% END -%]
        -c:v libx264 -crf 20 \
        -c:a libfdk_aac -b:a 128k \
        [% item.new_file %]
fi

[% END -%]
[% END -%]

EOF

    my $tt = Template->new;
    $tt->process( \$text, { data => $yml, }, $bash_file->stringify )
        or die Template->error;

    print "\n";
}
else {
    die "Undefined action [-a $action]\n";
}

exit;
