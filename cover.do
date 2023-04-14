#!/usr/bin/env fish

# cover.do

# This file is part of project Cosmoglotta (http://ne.alinome.net) by
# Marcos Cruz (programandala.net).
#
# This redo (https://github.com/apenwarr/redo) file builds all of the
# volume cover images.
#
# Requirement:
# - fish (https://fishshell.com)
#
# Last modified 20230413T1500+0200.

set covers tmp/(basename --suffix=.adoc (ls src/cosmoglotta_*.adoc -1)).cover.jpg

redo-ifchange $covers

# vim: filetype=fish
