local map = vim.keymap.set
vim.g.mapleader = " "

-- Tab/Shift-Tab: Like browser tabs, feels natural
-- map("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
-- map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
-- map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to last edited Buffer" })

vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
