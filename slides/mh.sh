#!/bin/bash

FILE="$1"
HEIGHT=`identify -format "%[fx:h]" "${FILE}"`

# 8 cm / 2.54 * 600
max_h=1890

# 4 cm / 2.54 * 300
min_h=472

if [[ $HEIGHT -gt $max_h ]]; then
	mogrify -resize "x${max_h}" "$FILE"
fi

if [[ $HEIGHT -lt $min_h ]]; then
	mogrify -resize "x${min_h}" "$FILE"
fi

BASE=`basename "${FILE%.*}"`
convert -units PixelsPerInch "$FILE" -density 300 "$BASE.jpg"
