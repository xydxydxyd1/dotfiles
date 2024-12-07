-- Keys are langauge servers accepted by lspconfig. Values are passed to setup
lsp_setups = {
    rust = {
        settings = {
            ['rust-analyzer'] = {
                diagnostics = {
                    disabled = {"unused_import", "unused_variables"}
                },
                check = {
                    ignore = {"unused_import", "unused_variables"}
                },
            }
        }
    }
}

return {
    {"tpope/vim-fugitive"},
    {"junegunn/fzf"},
    {
        "junegunn/fzf.vim",
        init = function()
            vim.keymap.set("n", "<C-n>", ":GFiles<CR>", {noremap = true})
            vim.keymap.set("n", "<C-m>", ":Buffer<CR>", {noremap = true})
        end
    },
    {
        "neovim/nvim-lspconfig",
        init = function()
            installed_lsps = require("config.local").installed_lsps
            for _, lsp in ipairs(installed_lsps) do
                args = lsp_setups[lsp]
                if args == nil then args = {} end
                require("lspconfig")[lsp].setup(args)
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
                    set_keymap("textDocument/rename", "\\rn", vim.lsp.buf.rename)
                    set_keymap("textDocument/definition", "gd", vim.lsp.buf.definition)
                    set_keymap("textDocument/formatting", "\\f", vim.lsp.buf.format)
                    set_keymap("textDocument/hover", "\\d", vim.lsp.buf.hover)
                    -- clangd didn't work well
                    --set_keymap("textDocument/diagnostic", "\\a", vim.diagnostic.open_float)
                    vim.keymap.set("n", "\\h", vim.diagnostic.open_float, {noremap=true})
                end,
            })
        end
    },
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "zathura_simple"

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
    { "bullets-vim/bullets.vim" },
    { "tpope/vim-abolish" },
    {
        "jghauser/follow-md-links.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
