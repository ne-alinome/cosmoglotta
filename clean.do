# clean.do

# This file is part of project Cosmoglotta (http://ne.alinome.net) by
# Marcos Cruz (programandala.net).
#
# This redo (https://github.com/apenwarr/redo) file cleans the target
# and temporary directories of the project.
#
# Requirement:
# - fish (https://fishshell.com)
#
# Last modified 20230413T1500+0200.

find target/* tmp/* ! -name "*.do" -delete

# vim: filetype=sh
