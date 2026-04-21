return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = {
                    "lua", "go", "kotlin", "java",
                    "json", "yaml", "markdown", "vim", "vimdoc",
                    "bash", "html", "css", "javascript", "typescript",
                },
            })
        end,
    },
}