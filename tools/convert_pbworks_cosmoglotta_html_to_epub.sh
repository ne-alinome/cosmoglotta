#!/bin/sh

# convert_pbworks_cosmoglotta_html_to_epub.sh

# Convert all issues of Cosmoglotta
# downloaded from <http://cosmoglotta.pbworks.com>
# into a single EPUB.

# By Marcos Cruz (programandala.net)
#
# 2019-02-24: Start. Convert throw Markdown.
#
# 2019-05-13: Add to the EPUB project. Use the <src> and <target>
# directories.

cd src

find . -name "Cosmoglotta*.html" -exec pandoc -f html -t markdown -o '{}'.md '{}' ';'

echo "% Cosmoglotta\n%\n%\n" > cosmoglotta.md
cat Cosmoglotta*.html.md >> cosmoglotta.md

echo "% Cosmoglotta A\n%\n%\n" > cosmoglotta-a.md
cat Cosmoglotta*-A-*.html.md >> cosmoglotta-a.md

echo "% Cosmoglotta B\n%\n%\n" > cosmoglotta-b.md
cat Cosmoglotta*-B-*.html.md >> cosmoglotta-b.md

find . -name "cosmoglotta*.md" -exec pandoc -f markdown -t epub3 -o '{}'.epub '{}' ';'

cd -

mv src/*.epub target/

exit 0
