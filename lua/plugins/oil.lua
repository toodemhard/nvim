return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	opts = {
		buf_options = {
			buflisted = true,
		},
		win_options = {},
		view_options = {
			show_hidden = true,
		},
		skip_confirm_for_simple_edits = true,
		experimental_watch_for_changes = true,
	},
	config = function(_, opts)
		require("oil").setup(opts)
		vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>")
	end,
}
