-- Load vimrc
function script_path()
   local str = debug.getinfo(2, "S").source:sub(2)
   return str:match("(.*/)")
end
vim.cmd('source ' .. script_path() .. '/basic.vim')
vim.cmd('source ' .. script_path() .. '/mappings.vim')

-- Default is really bad
vim.cmd.colorscheme("habamax")

require("config.lazy")
require("extraconf")
