return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.lsp.config("*", {
                capabilities = capabilities,
            })

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            vim.lsp.config("gopls", {})
            vim.lsp.config("kotlin_language_server", {
                init_options = {
                    storagePath = vim.fn.stdpath("cache") .. "/kotlin_language_server",
                },
            })
            vim.lsp.config("jdtls", {})

            vim.lsp.enable({
                "lua_ls",
                "gopls",
                "kotlin_language_server",
                "jdtls",
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local opts = { buffer = args.buf }
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
                    vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts)
                    vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts)
                end,
            })
        end,
    },
}