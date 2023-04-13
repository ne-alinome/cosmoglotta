# default.epub.do

# This file is part of project Cosmoglotta (http://ne.alinome.net) by
# Marcos Cruz (programandala.net).
#
# This redo (https://github.com/apenwarr/redo) file builds a volume in
# EPUB format.
#
# Requirement:
# - Asciidoctor EPUB3, by Dan Allen and Sarah White
#   (https://github.com/asciidoctor/asciidoctor-epub3)
#
# Last modified 20230413T1453+0200.

redo-ifchange \
  ../src/about_this_book.adoc \
  ../src/common_attributes.adoc \
  ../img/$2.jpg

asciidoctor-epub3 --out-file=$3 ../src/$2.adoc

# vim: filetype=sh
