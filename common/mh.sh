#!/bin/bash

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

BASE=`basename "${FILE%.*}"`
convert -units PixelsPerInch "$FILE" -density 300 "$BASE.jpg"
