-- Load vimrc
function script_path()
   local str = debug.getinfo(2, "S").source:sub(2)
   return str:match("(.*/)")
end
vim.cmd('source ' .. script_path() .. '/vimrc')

-- Add color column for text width"
require('editorconfig').properties.max_line_length = function(bufnr, val, opts)
  if opts.charset and opts.charset ~= "utf-8" then
    error("foo can only be set when charset is utf-8", 0)
  end
  print(val)
    vim.cmd('set textwidth='..val)
    vim.cmd('set colorcolumn='..val)
end
