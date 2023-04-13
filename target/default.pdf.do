# default.pdf.do

# This file is part of project Cosmoglotta (http://ne.alinome.net) by
# Marcos Cruz (programandala.net).
#
# This redo (https://github.com/apenwarr/redo) file builds a volume in
# PDF format.
#
# Requirement:
# - Asciidoctor PDF, by Dan Allen and Sarah White
#   (https://github.com/asciidoctor/asciidoctor-pdf)
#
# Last modified 20230413T1453+0200.

redo-ifchange \
  ../src/about_this_book.adoc \
  ../src/common_attributes.adoc \
  ../tmp/$2.jpg.pdf

asciidoctor-pdf --out-file=$3 ../src/$2.adoc

# vim: filetype=sh
