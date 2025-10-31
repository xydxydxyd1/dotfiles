-- Programming langauge functionalities such as language server and debugger

return {
    {
        "neovim/nvim-lspconfig",
        init = function()
            installed_lsps = require("config.local").installed_lsps
            for _, lsp in ipairs(installed_lsps) do
                vim.lsp.enable(lsp)
            end
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    function set_keymap(method, lhs, rhs)
                        opts={noremap=true}
                        if client.supports_method(method) then
                            vim.keymap.set("n", lhs, rhs, opts)
                        end
                    end
                    set_keymap("textDocument/rename", "<Leader>rn", vim.lsp.buf.rename)
                    set_keymap("textDocument/definition", "gd", vim.lsp.buf.definition)
                    set_keymap("textDocument/formatting", "<Leader>f", vim.lsp.buf.format)
                    set_keymap("textDocument/hover", "<Leader>d", vim.lsp.buf.hover)
                    -- clangd didn't work well
                    --set_keymap("textDocument/diagnostic", "<Leader>a", vim.diagnostic.open_float)
                    vim.keymap.set("n", "<Leader>h", vim.diagnostic.open_float, {noremap=true})
                    vim.keymap.set("n", "<Leader>rf", vim.lsp.buf.references, {noremap=true})
                    vim.keymap.set("n", "<Leader>n", vim.diagnostic.goto_next, {noremap=true})
                    vim.keymap.set("n", "<Leader>N", vim.diagnostic.goto_prev, {noremap=true})
                end,
            })
        end
    },
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "zathura_simple"
            -- Annoying with dndbook twocolumns
            -- vim.g.vimtex_quickfix_enabled = 0

            vim.g.vimtex_compiler_latexmk = {
                aux_dir = '',
                out_dir = '',
                callback = 1,
                continuous = 1,
                executable = 'latexmk',
                hooks = {},
                options = {
                    '-verbose',
                    '-file-line-error',
                    '-synctex=1',
                    '-interaction=nonstopmode',
                    '-shell-escape',
                },
            }
        end
    },
}
