# default.html.do

# This file is part of project Cosmoglotta (http://ne.alinome.net) by
# Marcos Cruz (programandala.net).
#
# This redo (https://github.com/apenwarr/redo) file builds a volume in
# HTML format.
#
# Requirement:
# - Asciidoctor, by Dan Allen and Sarah White
#   (https://asciidoctor.org)
#
# Last modified 20230413T1453+0200.

redo-ifchange \
  ../src/about_this_book.adoc \
  ../src/common_attributes.adoc

asciidoctor --out-file=$3 ../src/$2.adoc

# vim: filetype=sh
