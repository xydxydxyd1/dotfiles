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
    {"neovim/nvim-lspconfig"},
}
