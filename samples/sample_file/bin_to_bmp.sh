#!/bin/bash

INPUT="in0w1280-h720-rgba8888.bin
       in1w1280-h720-rgba8888.bin"
for in in $INPUT; do
    name=`basename -s .bin $in`
    out=${name}.bmp
    if [ ! -r $out ]; then
        echo "Convert '$in' -> '$out'"
        ffmpeg -f rawvideo -s 1280x720 -pix_fmt rgba -i $in $out
    fi
done
