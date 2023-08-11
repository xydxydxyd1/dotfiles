let s:my_dir = expand('<sfile>:p:h')
if filereadable(expand(s:my_dir."/typescript.vim"))
    :execute "source".s:my_dir."/typescript.vim"
endif
