" Uncomment to temporarily disable Copilot for all filetypes
let g:copilot_enabled = v:false
"let g:copilot_filetypes = {
"	    \ '*': v:false,
"	    \ 'tex': v:true,
"		\ 'markdown': v:true,
"	    \ }
command CopilotForceEnable let b:copilot_enabled = v:true
" Needed for custom Accept mapping
let g:copilot_no_tab_map = v:true
