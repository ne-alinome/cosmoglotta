# Makefile of _Cosmoglotta_

# By Marcos Cruz (programandala.net)

# Last modified: 202012241833.
# See change log at the end of the file.

# ==============================================================
# Requirements {{{1

# Asciidoctor (by Dan Allen, Sarah White et al.)
#   http://asciidoctor.org

# Asciidoctor EPUB3 (by Dan Allen and Sarah White)
#   http://github.com/asciidoctor/asciidoctor-epub3

# Asciidoctor PDF (by Dan Allen and Sarah White)
#   http://github.com/asciidoctor/asciidoctor-pdf

# dbtoepub
#   http://docbook.sourceforge.net/release/xsl/current/epub/README

# Pandoc (by John MacFarlane)
#   http://pandoc.org

# xsltproc
#   http://xmlsoft.org/xslt/xsltproc.html

# ==============================================================
# Config {{{1

VPATH=./src:./target

book_basename=cosmoglotta
title="Cosmoglotta"
author="Cosmoglotta"
editor="Marcos Cruz (programandala.net)"
publisher="ne alinome"
lang="ie"
description="Oficial organ de Interlingue (Occidental); omni numerós publicat ínter li annus 1927 e 1950"

# ==============================================================
# Interface {{{1

.PHONY: all
all: epuba pdf

.PHONY: epub
epub: epuba epubd epubp epubx

.PHONY: epuba
epuba: target/$(book_basename).adoc.epub

.PHONY: epubd
epubd: target/$(book_basename).adoc.dbk.dbtoepub.epub

.PHONY: epubp
epubp: target/$(book_basename).adoc.dbk.pandoc.epub

.PHONY: epubx
epubx: target/$(book_basename).adoc.dbk.xsltproc.epub

.PHONY: html
html: target/$(book_basename).adoc.html

.PHONY: odt
odt: target/$(book_basename).adoc.dbk.pandoc.odt

.PHONY: pdf
pdf: pdfa4 pdfletter

.PHONY: pdfa4
pdfa4: target/$(book_basename).adoc.a4.pdf

.PHONY: pdfletter
pdfletter: target/$(book_basename).adoc.letter.pdf

.PHONY: clean
clean:
	rm -f target/* tmp/*

# A temporary rule:
.PHONY: it
it: target/$(book_basename).md.epub

# ==============================================================
# Convert Asciidoctor to PDF {{{1

target/%.adoc.a4.pdf: src/%.adoc
	asciidoctor-pdf \
		--out-file=$@ $<

target/%.adoc.letter.pdf: src/%.adoc
	asciidoctor-pdf \
		--attribute pdf-page-size=letter \
		--out-file=$@ $<

# ==============================================================
# Convert Asciidoctor to EPUB {{{1

target/%.adoc.epub: src/%.adoc
	asciidoctor-epub3 \
		--out-file=$@ $<

# ==============================================================
# Convert Asciidoctor to DocBook {{{1

.SECONDARY: tmp/$(book_basename).adoc.dbk

tmp/%.adoc.dbk: src/%.adoc
	asciidoctor --backend=docbook5 --out-file=$@ $<

# ==============================================================
# Convert Asciidoctor to HTML {{{1

target/%.adoc.html: src/%.adoc
	asciidoctor --out-file=$@ $<

# ==============================================================
# Convert DocBook to EPUB {{{1

# ------------------------------------------------
# With dbtoepub {{{2

target/$(book_basename).adoc.dbk.dbtoepub.epub: \
	tmp/$(book_basename).adoc.dbk \
	src/$(book_basename)-docinfo.xml
	dbtoepub \
		--output $@ $<

# ------------------------------------------------
# With pandoc {{{2

target/$(book_basename).adoc.dbk.pandoc.epub: \
	tmp/$(book_basename).adoc.dbk \
	src/$(book_basename)-docinfo.xml \
	src/pandoc_epub_template.txt \
	src/pandoc_epub_stylesheet.css
	pandoc \
		--from docbook \
		--to epub3 \
		--template=src/pandoc_epub_template.txt \
		--css=src/pandoc_epub_stylesheet.css \
		--variable=lang:$(lang) \
		--variable=editor:$(editor) \
		--variable=publisher:$(publisher) \
		--variable=description:$(description) \
		--output $@ $<

# ------------------------------------------------
# With xsltproc {{{2

target/%.adoc.dbk.xsltproc.epub: tmp/%.adoc.dbk
	rm -fr tmp/xsltproc/* && \
	xsltproc \
		--output tmp/xsltproc/ \
		/usr/share/xml/docbook/stylesheet/docbook-xsl/epub/docbook.xsl \
		$< && \
	echo -n application/epub+zip > tmp/xsltproc/mimetype && \
	cd tmp/xsltproc/ && \
	zip -0 -X ../../$@.zip mimetype && \
	zip -rg9 ../../$@.zip META-INF && \
	zip -rg9 ../../$@.zip OEBPS && \
	cd - && \
	mv $@.zip $@

# XXX TODO -- Find out how to pass parameters and their names, from the XLS:
#    --param epub.ncx.filename testing.ncx \

# XXX TODO -- Add the stylesheet. The XLS must be modified first,
# or the resulting XHTML must be modified at the end.
#  cp -f src/xsltproc/stylesheet.css tmp/xsltproc/OEBPS/ && \

# ==============================================================
# Convert DocBook to OpenDocument {{{1

target/$(book_basename).adoc.dbk.pandoc.odt: \
	tmp/$(book_basename).adoc.dbk \
	src/$(book_basename)-docinfo.xml \
	src/pandoc_odt_template.txt
	pandoc \
		--from docbook \
		--to odt \
		--template=src/pandoc_odt_template.txt \
		--variable=lang:$(lang) \
		--variable=editor:$(editor) \
		--variable=publisher:$(publisher) \
		--variable=description:$(description) \
		--output $@ $<

# ==============================================================
# Convert Markdown to EPUB {{{1

# This is a temporary rule, needed only during the first phase of the project.

# XXX FIXME -- pandoc: out of memory (requested 1048576 bytes)

target/$(book_basename).md.epub: src/$(book_basename).md
	pandoc \
		--from markdown \
		--to epub \
		--variable=lang:$(lang) \
		--variable=editor:$(editor) \
		--variable=publisher:$(publister) \
		--variable=description:$(description) \
		--output $@ $<

# ==============================================================
# Online documentation {{{2

# Online documentation displayed on the Fossil repository.

.PHONY: wwwdoc
wwwdoc: wwwreadme

.PHONY: cleanwww
cleanwww:
	rm -f \
		doc/www/* \
		tmp/README.*

.PHONY: wwwreadme
wwwreadme: doc/www/README.html

doc/www/README.html: tmp/README.html
	echo "<div class='fossil-doc' data-title='README'>" > $@;\
	cat $< >> $@;\
	echo "</div>" >> $@

tmp/README.html: README.adoc
	asciidoctor \
		--embedded \
		--out-file=$@ $<

# ==============================================================
# Change log {{{1

# 2019-02-24: Start.
#
# 2019-05-14: Add a temporary rule to convert from Markdown to EPUB.
#
# 2019-08-03: Add ODT rule. Set all metadata variables.
#
# 2019-08-09: Fix passing of `editor` and `publisher` variables.
#
# 2020-03-30: Build an EPUB also with Asciidoctor EPUB3. Improve the list of
# requirements.
#
# 2020-08-09: Replace DocBook extension .xml with .dbk.
#
# 2020-08-10: Update the publisher's name. Deprecate EPUBs built by Pandoc,
# dbtoepub and xsltproc: they convert DocBook, which doesn't support horizontal
# rules.
#
# 2020-08-11: Add rule to convert Asciidoctor to HTML.
#
# 2020-12-24: Build an online version of the README file for the Fossil
# repository.
