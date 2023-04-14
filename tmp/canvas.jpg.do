# canvas.jpg.do

# This file is part of project Cosmoglotta (http://ne.alinome.net) by
# Marcos Cruz (programandala.net).
#
# This redo (https://github.com/apenwarr/redo) file creates the cover
# image canvas.
#
# Requirement:
# - ImageMagick (https://www.imagemagick.org)
#
# Last modified 20230413T1425+0200.

redo-ifchange ../src/cover_attributes.sh

. ../src/cover_attributes.sh

# XXX FIXME GraphicMagick's `gm convert` causes this error:
# Unable to open file (white) [No existe el fichero o el directorio].
convert -size ${width}x$height canvas:$background_color $3.jpg
mv $3.jpg $3
