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
    { "bullets-vim/bullets.vim" },
    { "tpope/vim-abolish" },
    {
        "jghauser/follow-md-links.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
