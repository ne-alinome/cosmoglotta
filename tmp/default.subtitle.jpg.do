# default.subtitle.jpg.do

# This file is part of project Cosmoglotta (http://ne.alinome.net) by
# Marcos Cruz (programandala.net).
#
# This redo (https://github.com/apenwarr/redo) file creates an
# image with the title, which is common to all volumes.
#
# Requirement:
# - ImageMagick (https://www.imagemagick.org)
#
# Last modified 20230413T1928+0200.

redo-ifchange ../src/cover_attributes.sh

. ../src/cover_attributes.sh

# XXX REMARK Some how GraphicMagick makes a lower-quality image,
# modifies the font and puts the text at the right. ImageMagick works
# better:

convert \
  -background $background_color \
  -fill $fill_color \
  -font $subtitle_font \
  -pointsize 125 \
  -size 800x \
  -gravity center \
  caption:$(echo $2|cut --delimiter=_ --field=2) \
  $3.jpg
mv $3.jpg $3

# vim: filetype=sh
