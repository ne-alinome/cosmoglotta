" add_vim_folding_marks.vim
"
" Add Vim folding marks to the headings of the source.
"
" By Marcos Cruz (programandala.net)
"
" 2019-08-10: Start.

:%s@\n\n\(=== \+\(.\+\)\)$@\r\r\/\/ \2 {{{2\r\1@
:%s@\n\n\(==== \+\(.\+\)\)$@\r\r\/\/ \2 {{{3\r\1@
:%s@\n\n\(===== \+\(.\+\)\)$@\r\r\/\/ \2 {{{4\r\1@
:%s@\n\n\(====== \+\(.\+\)\)$@\r\r\/\/ \2 {{{5\r\1@
