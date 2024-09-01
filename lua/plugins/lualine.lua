return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local custom_gruvbox = require("lualine.themes.gruvbox")

		custom_gruvbox.normal.a.bg = "#83a598"
		custom_gruvbox.normal.c.bg = "#282828"
		custom_gruvbox.normal.b.bg = "#3c3836"
		custom_gruvbox.normal.c.fg = "#ebdbb2"

		custom_gruvbox.insert.a.bg = "#b8bb26"
		custom_gruvbox.insert.c.bg = "#282828"
		custom_gruvbox.insert.b.bg = "#3c3836"
		custom_gruvbox.command.c.fg = "#ebdbb2"

		custom_gruvbox.visual.a.bg = "#fabd2f"
		custom_gruvbox.visual.c.bg = "#282828"
		custom_gruvbox.visual.b.bg = "#3c3836"
		custom_gruvbox.visual.c.fg = "#ebdbb2"

		custom_gruvbox.command.a.bg = "#8ec07c"
		custom_gruvbox.command.c.bg = "#282828"
		custom_gruvbox.command.b.bg = "#3c3836"
		custom_gruvbox.command.c.fg = "#ebdbb2"

		custom_gruvbox.replace.b.bg = "#3c3836"

		require("lualine").setup({
			theme = "custom_gruvbox",
		})
	end,
}
