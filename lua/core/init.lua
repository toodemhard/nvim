require("core.remap")
require("core.set")
require("core.plugins")
require("core.neovide")

vim.cmd("colorscheme melange")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
