#!/bin/bash

function single() {
    inkscape -h $1 whiskers.svg --export-filename whiskers.iconset/icon_$1x$1.png
}

mkdir whiskers.iconset

single 16
single 32
single 64
single 128
single 256
single 512
single 1024

if [[ "$OSTYPE" == "darwin"* ]]; then
    iconutil --convert icns --output whiskers.icns whiskers.iconset
fi

mv whiskers.iconset/icon_*.png .
rm -r whiskers.iconset
