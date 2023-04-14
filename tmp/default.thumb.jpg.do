# default.thumb.jpg.do

# This file is part of project Cosmoglotta (http://ne.alinome.net) by
# Marcos Cruz (programandala.net).
#
# This redo (https://github.com/apenwarr/redo) file creates a thumb
# version of a cover image.
#
# Requirement:
# - GraphicMagick (https://www.graphicmagick.org)
#
# Last modified 20230413T1425+0200.

redo-ifchange $2.jpg
gm convert $2.jpg -resize 190x $3.jpg
mv $3.jpg $3

# vim: filetype=sh
