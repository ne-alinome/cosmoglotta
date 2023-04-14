# default.cover.jpg.do

# This file is part of project Cosmoglotta (http://ne.alinome.net) by
# Marcos Cruz (programandala.net).
#
# This redo (https://github.com/apenwarr/redo) file creates a cover
# image.
#
# Requirement:
# - GraphicMagick (https://www.graphicmagick.org)
#
# Last modified 20230414T1129+0200.

redo-ifchange \
  canvas.jpg \
  title.jpg \
  $2.subtitle.jpg \
  publisher.jpg \
  $2.picture.jpg

gm composite -gravity north -geometry +0+070 title.jpg canvas.jpg $3.jpg
gm composite -gravity north -geometry +0+200 $2.subtitle.jpg $3.jpg $3.jpg
gm composite -gravity south -geometry +0+100 $2.picture.jpg $3.jpg $3.jpg
gm composite -gravity south -geometry +0+048 publisher.jpg $3.jpg $3.jpg
mv $3.jpg $3

# vim: filetype=sh
