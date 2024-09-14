return {
    {"tpope/vim-fugitive"},
    {"junegunn/fzf"},
    {
        "junegunn/fzf.vim",
        init = function()
            vim.api.nvim_set_keymap("n", "<C-n>", ":GFiles<CR>", {noremap = true})
            vim.api.nvim_set_keymap("n", "<C-m>", ":Buffer<CR>", {noremap = true})
        end
    },
    {"neovim/nvim-lspconfig"},
}
