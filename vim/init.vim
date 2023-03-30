" Redirect neovim to vimrc file

let s:path = expand('<sfile>:p:h')

let s:rc_path = s:path . "/vimrc"
if filereadable(expand(s:rc_path))
	:execute "source" . expand(s:rc_path)
endif
