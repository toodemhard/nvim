return {
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                border = "rounded",
            },
        },
    },
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "hrsh7th/nvim-cmp" },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()
            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {},
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({})
                    end,
                },
            })

            require("lspconfig").zls.setup({
                settings = {
                    zls = {
                        enable_autofix = true
                    },
                }
            })

            require("lspconfig").clangd.setup({
                cmd = {"clangd", "-header-insertion=never"}
            })

            local luasnip = require("luasnip")
            local cmp = require("cmp")

            luasnip.config.history = true
            -- vim.keymap.set({ "i", "n", "v" }, "<c-k>", function()
            --     if luasnip.locally_jumpable(1) then
            --         luasnip.jump(1)
            --     end
            --     print("jghdkj")
            -- end, { silent = true })
            -- vim.keymap.set({ "i", "n", "v" }, "<c-j>", function()
            --     if luasnip.locally_jumpable(-1) then
            --         luasnip.jump(-1)
            --     end
            -- end, { silent = true })

            cmp.setup({
                mapping = {
                    ["<cr>"] = cmp.mapping.confirm({}),
                    ["<c-k>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<c-j>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
                window = {
                    completion = cmp.config.window.bordered(),
                },
            })
        end,
    },
}
