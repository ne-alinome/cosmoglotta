# default.jpg.pdf.do

# This file is part of project Cosmoglotta (http://ne.alinome.net) by
# Marcos Cruz (programandala.net).
#
# This redo (https://github.com/apenwarr/redo) file converts a JPEG
# cover image to PDF. This is needed in order to make sure the cover
# image ocuppies the whole page in the PDF versions of the book.
#
# Requirement:
# - img2pdf by Johannes 'josch' Schauer
#   (https://gitlab.mister-muffin.de/josch/img2pdf/)
#
# Last modified 20230413T1453+0200.

redo-ifchange ../img/$2.jpg

img2pdf --output $3.jpg --border 0 ../img/$2.jpg
mv $3.jpg $3

# vim: filetype=sh
