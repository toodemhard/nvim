local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,

		clangd = function()
			require("lspconfig").clangd.setup({
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
					"--query-driver=C:\\Users\\User\\scoop\\apps\\gcc\\current\\bin\\g++.exe",
				},
			})
		end,
	},
})

local cmp = require("cmp")

cmp.setup({
	mapping = {
		["<CR>"] = cmp.mapping.confirm({}),
	},
	window = {
		completion = cmp.config.window.bordered(),
	},
})
