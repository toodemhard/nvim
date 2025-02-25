vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd("Oil"))

-- vim.keymap.del("n", "^K")

-- vim.keymap.set({"n", "v"}, "<C-b>", "<cmd>!build.bat<CR>", {silent=true});
vim.keymap.set("n", "<leader>g", "<cmd>Git<CR> <C-W>L", {})
vim.keymap.set({"n", "v"}, "<C-b>", function()
    local build_cmd = "build.bat"
    local existing_win = nil

    -- Check if a terminal buffer running build.bat already exists in a window
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local name = vim.api.nvim_buf_get_name(buf)
        if name:match("term://.*" .. build_cmd) then
            existing_win = win
            break
        end
    end

    local prev_win = vim.api.nvim_get_current_win()
    if existing_win then
        -- If found, switch to that window and start insert mode
        vim.api.nvim_set_current_win(existing_win)
        vim.cmd("term " .. build_cmd)

    else
        -- Save the current window so we can return to it later

        -- Open a vertical split and start a new terminal session
        vim.cmd("vsplit")
        local term_win = vim.api.nvim_get_current_win()
        vim.cmd("term " .. build_cmd)

        -- Move the terminal window to the right
        vim.cmd("wincmd L")

        -- Return focus to the previous window
    end
    vim.api.nvim_set_current_win(prev_win)
end, {silent=true});

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

vim.keymap.set({ "n", "v" }, "<leader>i",
function()
    vim.cmd("colorscheme melange")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
end
)
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
