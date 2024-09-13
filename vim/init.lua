-- Load vimrc
function script_path()
   local str = debug.getinfo(2, "S").source:sub(2)
   return str:match("(.*/)")
end
vim.cmd('source ' .. script_path() .. '/basic.vim')

-- Vim colorscheme is nice and greyish
vim.cmd [[colorscheme desert]]
