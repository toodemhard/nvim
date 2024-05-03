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

-- require("lspconfig").clangd.setup({
-- 	on_attach = on_attach,
-- 	cmd = {
-- 		"clangd",
-- 		"--offset-encoding=utf-16",
-- 		"--function-arg-placeholders=0",
-- 	},
-- })
