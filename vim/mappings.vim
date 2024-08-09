" All user-defined mappings. Load this file last in vimrc since it may
" contain functions defined by plugins

" # Configuration
" set leader key
let maplocalleader = ","


" # Insert mode

" COC
" Selection
inoremap <silent><expr> <C-J>
      \ coc#pum#visible() ? coc#pum#next(1) : ""
"      \ CheckBackspace() ? "\<Tab>" :
"      \ coc#refresh()
inoremap <expr><C-K> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" I don't know what this do
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" UltiSnips
let g:UltiSnipsExpandOrJumpTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Copilot
" Accept
imap <silent><script><expr> <C-L> copilot#Accept("\<CR>")

" # Normal mode

" COC
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>p <Plug>(coc-format)

" NerdTree
nnoremap <C-t> :NERDTreeToggle<CR>

" FZF
nnoremap <C-n> :GFiles<CR>
nnoremap <C-m> :Buffer<CR>
