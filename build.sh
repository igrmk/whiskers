#!/usr/bin/env bash
set -euo pipefail

tmp="$(mktemp -d)"
mac_icons="$tmp/mac.icons"
mac_iconset="$tmp/mac.iconset"
mkdir "$mac_icons"
mkdir "$mac_iconset"

xmlstarlet ed -u "/_:svg/@viewBox" -v "-18.3 -18.3 292.6 292.6" src/whiskers.svg > whiskers.svg

for i in 16 32 64 128 256 512 1024
do
    inkscape -h $i src/whiskers.svg --export-area=-18.3:-18.3:274.3:274.3 --export-filename whiskers_${i}x${i}.png
    inkscape -h $i src/whiskers.svg --export-area=-27:-27:283:283 --export-filename "$mac_icons/whiskers_${i}x${i}.png"
    exiftool -all= -overwrite_original_in_place whiskers_${i}x${i}.png
    exiftool -all= -overwrite_original_in_place "$mac_icons/whiskers_${i}x${i}.png"
done

for i in 16 32 128 256 512
do
    cp "$mac_icons/whiskers_${i}x${i}.png" "$mac_iconset/icon_${i}x${i}.png"
    cp "$mac_icons/whiskers_$((i * 2))x$((i * 2)).png" "$mac_iconset/icon_${i}x${i}@2x.png"
done

iconutil --convert icns --output whiskers.icns "$mac_iconset"
rm -r "$tmp"
