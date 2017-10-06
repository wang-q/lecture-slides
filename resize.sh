#!/bin/bash

USAGE="Usage: $0 IMAGE_FILE"

if [ "$#" -lt 1 ]; then
    echo >&2 "$USAGE"
    exit 1
fi

# check whether faops is installed
hash mogrify 2>/dev/null || {
    echo >&2 "ImageMagick is required but it's not installed.";
    echo >&2 "Install with homebrew: brew install imagemagick";
    exit 1;
}

FILE="$1"

HEIGHT=`identify -format "%[fx:h]" "${FILE}"`
WIDTH=`identify -format "%[fx:w]" "${FILE}"`

# 8 cm / 2.54 * 300
max_h=945

# 6 cm / 2.54 * 300
# This size don't fulfill the entire page.
mid_h=709

# 4 cm / 2.54 * 300
min_h=472

# 11 cm / 2.54 * 300 = 1299
max_w=1299

if [[ $HEIGHT -gt $max_h ]]; then
    mogrify -resize "x${max_h}" "$FILE"
elif [[ $HEIGHT -lt $min_h ]]; then
    mogrify -resize "x${min_h}" "$FILE"
else
    mogrify -resize "x${mid_h}" "$FILE"
fi

if [[ $WIDTH -gt $max_w ]]; then
    mogrify -resize "${max_w}x" "$FILE"
fi

# http://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash
BASE=$(basename "${FILE%.*}")
EXT=$(basename "${FILE##*.}")
if [[ EXT -eq "png" ]]; then
    convert -units PixelsPerInch -background white -alpha remove "$FILE" -density 300 "$BASE.jpg"
else
    convert -units PixelsPerInch "$FILE" -density 300 "$BASE.jpg"
fi
