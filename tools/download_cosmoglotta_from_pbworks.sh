#!/bin/sh

# download_cosmoglotta_from_pbworks.sh

# Download all issues of Cosmoglotta
# from <http://cosmoglotta.pbworks.com>
# in printable form.

# By Marcos Cruz (programandala.net)

# ==============================================================
# Change log

# 2019-02-22: Start.
#
# 2019-05-13: Rename the HTML files to sort them by date instead of
# series and number. Add this file to the EPUB project and rename it.
# Download the files in the <tmp> and <src> directories.

# ==============================================================
# Download

site=http://cosmoglotta.pbworks.com

rm -f index.html
wget --output-document=tmp/index.html $site

issues=$( \
  grep 'href="/Cosmog' tmp/index.html | \
  sed -e 's/.*href="\/\(.\+\()\|%29\)\)".*/\1/' )

for issue in ${issues}
do
  wget --output-document=src/${issue}.html ${site}/${issue}?mode=embedded
done

# ==============================================================
# Rename the files

cd src

# Tidy filenames:
mmv "*%28*%29*.html" "#1(#2)#3.html"
mmv "*+*+*+*+*.html" "#1-#2-#3-#4-#5.html"

# Rename filenames to sort them by date:
mmv "*(*-19??)*" "#1(19#3#4-#2)#5"
mmv "*-jan*" "#1-01#02"
mmv "*-feb*" "#1-02#02"
mmv "*-mar*" "#1-03#02"
mmv "*-apr*" "#1-04#02"
mmv "*-may*" "#1-05#02"
mmv "*-jun*" "#1-06#02"
mmv "*-jul*" "#1-07#02"
mmv "*-aug*" "#1-08#02"
mmv "*-sep*" "#1-09#02"
mmv "*-oct*" "#1-10#02"
mmv "*-nov*" "#1-11#02"
mmv "*-dec*" "#1-12#02"

mmv "Cosmoglotta-?-???-(*).html" "Cosmoglotta-#5-#1-#2#3#4.html"
mmv "Cosmoglotta-?-???-???-(*).html" "Cosmoglotta-#8-#1-#2#3#4-#5#6#7.html"

cd -

exit 0
