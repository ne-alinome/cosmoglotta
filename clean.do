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
# Last modified 20230413T1632+0200.

find target/* tmp/* ! -name "*.do" -delete
find . -name "*.did" -delete
find . -name "*.did.tmp" -delete

# vim: filetype=sh
