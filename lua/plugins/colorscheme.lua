return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        opts = {
            -- transparent_mode = true,
        },
        -- config = function()
        --     vim.cmd("colorscheme gruvbox")
        -- end
    },
    {
        "xero/miasma.nvim",
        lazy = false,
        priority = 1000,
        -- config = function()
        --     vim.cmd("colorscheme miasma")
        -- end,
    },
    { "savq/melange-nvim" },
    {
        "rebelot/kanagawa.nvim",
        opts = {
            -- transparent = true,
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none",
                        }
                    }
                },
            }
        },
        -- { "ellisonleao/gruvbox.nvim" },
        -- priority = 1000,
        -- config = function()
        -- require("gruvbox").setup({
        --     transparent_mode = true,
        -- })
        -- vim.cmd("colorscheme kanagawa-dragon")
        -- end
    },
    {
        "nyoom-engineering/oxocarbon.nvim"
    },
    {
        "EdenEast/nightfox.nvim"
    }
}
