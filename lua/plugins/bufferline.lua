return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
        options = {
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "Explorer",
                    highlight = "Directory",
                    separator = true,
                },
            },
        },
    },
    keys = {
        { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next tab" },
        { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous tab" },
        { "<leader>x", "<cmd>bdelete<cr>", desc = "Close tab" },
    },
}
