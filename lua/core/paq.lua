require "paq" {
    "savq/paq-nvim", -- Let Paq manage itself


    {"nvim-treesitter/nvim-treesitter"},
    {"nvim-lua/plenary.nvim"},
    {"ThePrimeagen/harpoon"},
    {"stevearc/oil.nvim"},
    {"savq/melange-nvim"},
    {"nvim-telescope/telescope.nvim"},
	{"numToStr/Comment.nvim"},
    {
        "williamboman/mason.nvim",
        -- opts = {
        --     ui = {
        --         border = "rounded",
        --     },
        -- },
    },
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "hrsh7th/nvim-cmp" },
    {"VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
    },
	{"numToStr/Comment.nvim"},
    {'junegunn/goyo.vim'},
	{"tpope/vim-fugitive"},
	{"lewis6991/gitsigns.nvim"},

    {"windwp/nvim-autopairs"},
    {"lukas-reineke/indent-blankline.nvim"},
}

require("ibl").setup()

require("nvim-autopairs").setup {
    enable_afterquote = false,
}
require('nvim-autopairs').remove_rule('`')

require("nvim-treesitter.configs").setup({
    auto_install = true,
    highlight = { enable = true },
})
--
-- do
--     local neogit = require('neogit')
--     neogit.setup {}
-- end

require("Comment").setup()

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set({ "n", "v" }, "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<A-1>", function()
    ui.nav_file(1)
end)
vim.keymap.set("n", "<A-2>", function()
    ui.nav_file(2)
end)
vim.keymap.set("n", "<A-3>", function()
    ui.nav_file(3)
end)
vim.keymap.set("n", "<A-4>", function()
    ui.nav_file(4)
end)
vim.keymap.set("n", "<A-5>", function()
    ui.nav_file(5)
end)

require("oil").setup({
    buf_options = {
        buflisted = true,
    },
    win_options = {},
    view_options = {
        show_hidden = true,
    },
    skip_confirm_for_simple_edits = true,
    watch_for_changes = true,

    keymaps = {
        ["<C-p>"] = false,
        ["<C-h>"] = false,
        ["<C-s>"] = "actions.refresh",
        ["<C-l>"] = false,
    }
})
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>")

do
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    vim.keymap.set("n", "<C-p>", builtin.find_files, {})

    local telescope = require("telescope")
    local telescopeConfig = require("telescope.config")

    -- Clone the default Telescope configuration
    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

    -- I want to search in hidden/dot files.
    table.insert(vimgrep_arguments, "--hidden")
    -- I don't want to search in the `.git` directory.
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")

    telescope.setup({
        defaults = {
            -- `hidden = true` is not supported in text grep commands.
            vimgrep_arguments = vimgrep_arguments,
        },
        pickers = {
            find_files = {
                -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
                find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
            },
        },
    })
end

-- {
-- branch = "v3.x",
do
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

    -- local luasnip = require("luasnip")
    local cmp = require("cmp")

    -- luasnip.config.history = true
    -- vim.keymap.set({ "i", "n", "v" }, "<c-k>", function()
    --     if luasnip.locally_jumpable(2) then
    --         luasnip.jump(1)
    --     end
    --     print("jghdkj")
    --     print(luasnip.locally_jumpable(3));
    -- end, { silent = true })
    -- vim.keymap.set({ "i", "n", "v" }, "<c-j>", function()
    --     luasnip.jump(-1)
    --     -- if luasnip.locally_jumpable(-1) then
    --     -- end
    -- end, { silent = true })
    -- local luasnip = require("luasnip")
    --
    -- luasnip.config.history = true
    -- vim.keymap.set({ "i", "n", "v" }, "<c-k>", function()
    --     if luasnip.locally_jumpable(2) then
    --         luasnip.jump(1)
    --     end
    --     print("jghdkj")
    --     print(luasnip.locally_jumpable(3));
    -- end, { silent = true })
    -- vim.keymap.set({ "i", "n", "v" }, "<c-j>", function()
    --     luasnip.jump(-1)
    --     -- if luasnip.locally_jumpable(-1) then
    --     -- end
    -- end, { silent = true })

    local cmp = require("cmp")
    cmp.setup({
        enabled = false,
        mapping = {
            ["<cr>"] = cmp.mapping.confirm({}),
            -- ["<c-k>"] = cmp.mapping(function(fallback)
            --     print(luasnip.locally_jumpable(1))
            --     if luasnip.locally_jumpable(1) then
            --         luasnip.jump(1)
            --     else
            --         fallback()
            --     end
            -- end, { "i", "s" }),
            --
            -- ["<c-j>"] = cmp.mapping(function(fallback)
            --     if luasnip.locally_jumpable(-1) then
            --         luasnip.jump(-1)
            --     else
            --         fallback()
            --     end
            -- end, { "i", "s" }),
        },
        snippet = {
            expand = function(args)
                -- You need Neovim v0.10 to use vim.snippet
                vim.snippet.expand(args.body)
                end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        -- sources = {
        --     {name = 'nvim_lsp'},
        -- }
        sources = {},
    })
end

