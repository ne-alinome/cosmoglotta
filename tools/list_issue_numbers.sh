#!/bin/sh

# list_issue_numbers.sh

# List all issues of Cosmoglotta
# included in the source.

# By Marcos Cruz (programandala.net)
#
# 2019-08-10: Start.

# Series A (Cosmoglotta):
grep "==\sCosmoglotta\sA\s" src/cosmoglotta.adoc

# Series B (Cosmoglotta-Informationes):
grep "==\sCosmoglotta\sB\s" src/cosmoglotta.adoc
