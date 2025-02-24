vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd("Oil"))

-- vim.keymap.del("n", "^K")

vim.keymap.set({"n", "v"}, "<C-b>", "<cmd>!build.bat<CR>", {silent=true});

vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- vim.keymap.set("n", "<C-H>", "<C-w>H")
-- vim.keymap.set("n", "<C-J>", "<C-w>J")
-- vim.keymap.set("n", "<C-K>", "<C-w>K")
-- vim.keymap.set("n", "<C-L>", "<C-w>L")

-- vim.keymap.set("n", "<leader>k", ":echo \"kys\"")
vim.keymap.set("n", "<leader>k", "<cmd>ClangdSwitchSourceHeader<cr>")

-- softwrap binds
vim.keymap.set({ "n", "v" }, "j", "gj")
vim.keymap.set({ "n", "v" }, "k", "gk")
vim.keymap.set({ "n", "v" }, "A", "g$a")
-- vim.keymap.set({ "n", "v" }, "I", "g0i")
-- vim.keymap.set({ "n", "v" }, "_", "g_")
-- vim.keymap.set({ "n", "v" }, "0", "g0")
vim.keymap.set({ "n", "v" }, "$", "g$")
--
-- vim.keymap.set("n", "<C-K>", "<Esc>f,vB");


-- local x = function()
--     pos.
-- end



vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==")
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("n", "Y", "yy")

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set({ "i", "c" }, "<C-H>", "<C-W>")
vim.keymap.set({ "i", "c" }, "<C-BS>", "<C-W>")
vim.keymap.set({ "i", "c" }, "<C-BS>", "<C-W>")
