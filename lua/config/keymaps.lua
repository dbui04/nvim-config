local map = vim.keymap.set
vim.g.mapleader = " "

-- Tab/Shift-Tab: Like browser tabs, feels natural
-- map("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
-- map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
-- map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to last edited Buffer" })

-- Terminal
local term_buf = nil
local term_win = nil

vim.keymap.set("n", "<leader>t", function()
	if term_win and vim.api.nvim_win_is_valid(term_win) then
		vim.api.nvim_win_close(term_win, true)
		term_win = nil
		return
	end

	vim.cmd("botright 12split")

	if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
		vim.cmd("buffer " .. term_buf)
	else
		vim.cmd("terminal")
		term_buf = vim.api.nvim_get_current_buf()
	end

	term_win = vim.api.nvim_get_current_win()
	vim.cmd("startinsert")
end, { desc = "Toggle terminal pane" })

vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n><C-w>c]], { desc = "Hide terminal" })
