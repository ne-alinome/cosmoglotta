#!/usr/bin/env fish

# html.do

# This file is part of project Cosmoglotta (http://ne.alinome.net) by
# Marcos Cruz (programandala.net).
#
# This redo (https://github.com/apenwarr/redo) file builds all of the 
# volumes in EPUB format.
#
# Requirement:
# - fish (https://fishshell.com)
#
# Last modified 20230413T1500+0200.

set targets target/(basename --suffix=.adoc (ls src/cosmoglotta_*.adoc -1)).html

redo-ifchange $targets

# vim: filetype=fish
