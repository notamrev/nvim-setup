return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true })
                end,
                desc = "Format buffer",
            },
        },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                go = { "goimports" },
                kotlin = { "ktlint" },
                java = { "google-java-format" },
            },
            format_on_save = {
                timeout_ms = 3000,
            },
        },
    },
}
