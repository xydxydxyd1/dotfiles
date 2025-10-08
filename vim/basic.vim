" Basic configuration with only built-in vim
set encoding=utf-8	" Required for vimtex and youcompleteme

" Syntax
filetype on
filetype plugin on
filetype indent on
au BufNewFile,BufRead PKGBUILD set filetype=sh
au BufNewFile,BufRead .envrc set filetype=sh

" Highlight trailing spaces
set list listchars=tab:\ \ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨

set mouse=a	" cursor goes where mouse clicks

" Appearance
syntax on
set number
set relativenumber
set incsearch
set ls=2
set hlsearch

" Editing
set backspace=indent,eol,start "set backspace so that it can delete newlines

" Set delay for escape sequence
set timeoutlen=1000
set ttimeoutlen=5

set updatetime=300 		" recommended by CoC
set signcolumn=yes		" no jumping around when diagnostic comes up
