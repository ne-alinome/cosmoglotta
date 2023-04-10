# This file is part of project Cosmoglotta (http://ne.alinome.net)
# by Marcos Cruz (programandala.net).
#
# Last modified 20230410T1746+0200.
# See change log at the end of the file.

# ==============================================================
# Requirements {{{1

# Asciidoctor (by Dan Allen, Sarah White et al.)
#   http://asciidoctor.org

# Asciidoctor EPUB3 (by Dan Allen and Sarah White)
#   http://github.com/asciidoctor/asciidoctor-epub3

# Asciidoctor PDF (by Dan Allen and Sarah White)
#   http://github.com/asciidoctor/asciidoctor-pdf

# ==============================================================
# Config {{{1

VPATH=./src:./target

book_basename=cosmoglotta

volumes=$(addprefix target/, $(basename $(notdir $(wildcard src/cosmoglotta_*.adoc))))

# ==============================================================
# Interface {{{1

.PHONY: all
all: epuba pdf

.PHONY: epub
epub: $(addsuffix .epub, $(volumes))

.PHONY: html
html: $(addsuffix .html, $(volumes))

.PHONY: pdf
pdf: pdf4

.PHONY: pdfa4
pdfa4: $(addsuffix _din-a4-format.pdf, $(volumes))

.PHONY: pdfletter
pdfletter: $(addsuffix _letter-format.pdf, $(volumes))

.PHONY: clean
clean:
	rm -f target/* tmp/*

# A temporary rule:
.PHONY: it
it: target/$(book_basename).md.epub

# ==============================================================
# Convert Asciidoctor to PDF {{{1

target/%_din-a4-format.pdf: src/%.adoc src/about_this_book.adoc
	asciidoctor-pdf \
		--out-file=$@ $<

target/%_letter-format.pdf: src/%.adoc src/about_this_book.adoc
	asciidoctor-pdf \
		--attribute pdf-page-size=letter \
		--out-file=$@ $<

# ==============================================================
# Convert Asciidoctor to EPUB {{{1

target/%.epub: src/%.adoc src/about_this_book.adoc
	asciidoctor-epub3 \
		--out-file=$@ $<

# ==============================================================
# Convert Asciidoctor to HTML {{{1

target/%.html: src/%.adoc src/about_this_book.adoc
	asciidoctor --out-file=$@ $<

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
#
# 2023-04-06: Remove online documentation rules, after migrating to Mercurial.
#
# 2023-04-10: Add prerequisite <about_this_book.adoc>. Remove building with
# Pandoc, dbtoepub and xsltproc. Remove .adoc suffix from target files.
