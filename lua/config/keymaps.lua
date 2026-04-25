local map = vim.keymap.set
vim.g.mapleader = " "

-- Tab/Shift-Tab: Like browser tabs, feels natural
-- map("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
-- map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
-- map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to last edited Buffer" })

-- Terminal
local term_buf = nil
local term_win = nil
