let g:maplocalleader = "_"
CocDisable

function! s:Pngpaste(destfile)
    execute '!pngpaste ' . a:destfile
    execute "normal! i" . "\\includegraphics[width=0.5\\textwidth]{./". a:destfile ."}". "\<Esc>"

endfunction

command! -nargs=1 Pngpaste call s:Pngpaste(<f-args>)
