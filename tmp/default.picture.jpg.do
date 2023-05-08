# default.picture.jpg.do

# This file is part of project Cosmoglotta (http://ne.alinome.net) by
# Marcos Cruz (programandala.net).
#
# This redo (https://github.com/apenwarr/redo) file creates the
# picture out of the original first page of the volume.
#
# Requirement:
# - ImageMagick (https://www.imagemagick.org)
#
# Last modified 20230413T1947+0200.

redo-ifchange ../src/cover_attributes.sh

. ../src/cover_attributes.sh

# XXX REMARK Some how GraphicMagick (`gm convert`) makes a
# lower-quality image, modifies the font and puts the text at the
# right. ImageMagick (`convert`) works better.

# XXX REMARK The syntax `-geometry WxH` of the `-geometry` option
# indicates the maximum width or heigth preserving the aspect ratio.

convert \
  ../img/$2.jpg \
  -geometry 800x1100 \
  -mattecolor gray98 \
  -frame 24x24+2+2 \
  -gravity center \
  $3.jpg
mv $3.jpg $3

# vim: filetype=sh
