nnoremap <C-t> :NERDTreeToggle<CR>

" Start NERDTree when Vim is started without file arguments.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if (argc() == 0 && !exists('s:std_in')) | NERDTreeVCS | endif
"autocmd VimEnter * NERDTreeVCS

" Start/stop NERDTree if window size is wide/narrow enough
"autocmd BufWinEnter * NERDTreeMirror
"autocmd TabEnter,VimResized * if &columns > 120 | NERDTreeFocus | endif
"autocmd VimEnter,TabEnter,VimResized * if &columns < 120 | NERDTreeClose | endif

" Start NERDTree when Vim starts with a directory argument.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
"    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
