let g:copilot_filetypes = {
	    \ '*': v:false,
	    \ 'tex': v:true,
		\ 'markdown': v:true,
	    \ }
:command CopilotForceEnable let b:copilot_enabled = v:true
imap <silent><script><expr> <C-I> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
