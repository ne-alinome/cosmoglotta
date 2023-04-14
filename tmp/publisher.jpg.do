# publisher.jpg.do

# This file is part of project Cosmoglotta (http://ne.alinome.net) by
# Marcos Cruz (programandala.net).
#
# This redo (https://github.com/apenwarr/redo) file creates an image
# with the publisher name.
#
# Requirement:
# - GraphicMagick (https://www.graphicmagick.org)
#
# Last modified 20230413T1425+0200.

redo-ifchange ../src/cover_attributes.sh
. ../src/cover_attributes.sh
gm convert \
  -background $background_color \
  -fill $fill_color \
  -font $publisher_font \
  -pointsize 24 \
  -gravity center \
  -size 148x \
  caption:"ne alinome" \
  $3.jpg
mv $3.jpg $3


# vim: filetype=sh
