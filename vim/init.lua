-- Load vimrc
function script_path()
   local str = debug.getinfo(2, "S").source:sub(2)
   return str:match("(.*/)")
end
vim.cmd('source ' .. script_path() .. '/basic.vim')

-- Default is really bad
vim.cmd.colorscheme("habamax")

-- Per-project configuration
vim.opt.exrc = true

-- Hot fix rst todo highlighting
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rst",
  callback = function()
    -- Define a match for TODO: and link it to the existing Todo highlight group
    vim.fn.matchadd("Todo", [[TODO:]])
  end,
})

require("config.lazy")
