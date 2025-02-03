local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- local plugins = {
-- 	"tpope/vim-sleuth",
-- }

local opts = {
	-- lazy = true,
	-- defaults = {
	-- 	lazy = true,
	-- },
	ui = {
		border = "rounded",
	},
    checker = {
        change_detection = {
            enabled = false,
        }
    }
}

require("lazy").setup("plugins", opts)
