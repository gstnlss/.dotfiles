hi link GitGutterAddLineNr DiffAdd
hi link GitGutterChangeLineNr DiffChange
hi link GitGutterDeleteLineNr DiffDelete
hi link GitGutterChangeDeleteLineNr DiffChange

autocmd! VimEnter * :GitGutterLineNrHighlightsEnable
