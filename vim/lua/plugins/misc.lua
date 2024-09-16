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
                require("lspconfig")[lsp].setup{}
            end
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    function set_keymap(method, lhs, rhs)
                        opts={noremap=true}
                        if client.supports_method('method') then
                            vim.keymap.set("n", lhs, rhs, opts)
                        end
                    end
                    set_keymap("textDocument/rename", "\\rn", vim.lsp.buf.rename)
                    set_keymap("textDocument/definition", "gd", vim.lsp.buf.definition)
                    set_keymap("textDocument/formatting", "\\f", vim.lsp.buf.format)
                    set_keymap("textDocument/hover", "\\d", vim.lsp.buf.hover)
                end,
            })
        end
    },
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_general_viewer = "okular"
            vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
        end
    },
}
