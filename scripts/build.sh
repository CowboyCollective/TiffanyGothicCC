#!/bin/sh


set -e

echo "Generating TrueType Fonts"
fontmake  -o ttf --output-dir ../fonts/ttf2/ -u ../sources/UFO/TiffanyGothicCC.ufo

echo "Hot Fixes"
gftools fix-dsig -f ../fonts/ttf2/*.ttf

mkdir -p ../fonts/ttf

ttfautohint -n ../fonts/ttf2/TiffanyGothicCC.ttf ../fonts/ttf/TiffanyGothicCC.ttf

gftools fix-hinting ../fonts/ttf/TiffanyGothicCC.ttf

echo "Cleaning Directory Up"
rm ../fonts/ttf/*.ttf

mv ../fonts/ttf/TiffanyGothicCC.ttf.fix ../fonts/ttf/TiffanyGothicCC.ttf

rm ../fonts/ttf2/*.ttf
rmdir ../fonts/ttf2

echo "Generating OpenType Fonts"
fontmake  -o otf --output-dir ../fonts/otf/ -u ../sources/UFO/TiffanyGothicCC.ufo

echo "Hot Fixes"
mv ../fonts/otf/Heavy.otf ../fonts/otf/TiffanyGothicCC.otf

echo "All Done!"
