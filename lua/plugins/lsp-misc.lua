return {
    { "williamboman/mason.nvim", opts = {} },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    local capabilities = require("cmp_nvim_lsp").default_capabilities()
                    if server_name == "lua_ls" then
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    workspace = {
                                        library = {
                                            [vim.env.VIMRUNTIME] = false,
                                        },
                                    },
                                },
                            },
                        })
                    else
                        require("lspconfig")[server_name].setup({ capabilities = capabilities })
                    end
                end,
            })
        end,
        dependencies = { "williamboman/mason.nvim" },
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts)
            require("lsp_signature").setup(opts)
        end,
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = "williamboman/mason.nvim",
        enabled = false,
    },
}
