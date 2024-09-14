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
                    if client.supports_method('textDocument/rename') then
                        vim.keymap.set("n",
                                "\\rn",
                                vim.lsp.buf.rename,
                                {noremap = true})
                    end
                    if client.supports_method('textDocument/definition') then
                        vim.keymap.set("n",
                                "gd",
                                vim.lsp.buf.definition,
                                {noremap = true})
                    end
                end,
            })
        end
    },
}
