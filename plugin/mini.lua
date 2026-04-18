vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

require("mini.starter").setup() -- Dashboard
-- require("mini.notify").setup() -- Notification UI
require("mini.pairs").setup() -- Auto-pair brackets
require("mini.sessions").setup() -- Session management

vim.keymap.set("n", "<leader>sw", function()
	if vim.v.this_session ~= "" then
		MiniSessions.write()
		return
	end

	vim.ui.input({ prompt = "New session name: " }, function(input)
		if not input or input == "" then
			return
		end

		if MiniSessions.detected[input] then
			vim.notify("Session already exists: " .. input, vim.log.levels.WARN)
			return
		end

		MiniSessions.write(input, { force = false })
	end)
end, { desc = "Write session" })

vim.keymap.set("n", "<leader>ss", function()
	MiniSessions.select("read")
end, { desc = "Session select" })

vim.keymap.set("n", "<leader>sd", function()
	MiniSessions.select("delete")
end, { desc = "Session delete" })

require("mini.completion").setup() -- Show lsp suggestions

require("mini.bufremove").setup() -- Buffer hide/delete

vim.keymap.set("n", "<leader>bd", function()
	MiniBufremove.delete()
end, { desc = "Delete current buffer" })

require("mini.pick").setup() -- Picker

vim.keymap.set("n", "<leader>ff", function()
	MiniPick.builtin.files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>fg", function()
	MiniPick.builtin.grep_live()
end, { desc = "Live grep" })

vim.keymap.set("n", "<leader>fb", function()
	MiniPick.builtin.buffers()
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>fh", function()
	MiniPick.builtin.help()
end, { desc = "Help tags" })

vim.keymap.set("n", "<leader>fr", function()
	MiniPick.builtin.resume()
end, { desc = "Resume picker" })

require("mini.cmdline").setup() -- Show Neovim cmdline suggestions
require("mini.bracketed").setup() -- Move quickly between buffers and comments
require("mini.diff").setup() -- Show git diff
require("mini.git").setup() -- Track git related data and allow git calls inside cmdline
require("mini.icons").setup() -- Provide file icons
require("mini.statusline").setup() -- Show status line

require("mini.files").setup({
	permanent_delete = false,
}) -- Allow navigating file system

vim.keymap.set("n", "<leader>fm", function()
	MiniFiles.open(vim.api.nvim_buf_get_name(0))
end, { desc = "Open mini.files" })

vim.keymap.set("n", "<leader>fM", function()
	MiniFiles.open()
end, { desc = "Open mini.files (cwd)" })

local miniclue = require("mini.clue") -- Show key combination hints
miniclue.setup({
	triggers = {
		-- Leader triggers
		{ mode = { "n", "x" }, keys = "<Leader>" },

		-- `[` and `]` keys
		{ mode = "n", keys = "[" },
		{ mode = "n", keys = "]" },

		-- Built-in completion
		{ mode = "i", keys = "<C-x>" },

		-- `g` key
		{ mode = { "n", "x" }, keys = "g" },

		-- Marks
		{ mode = { "n", "x" }, keys = "'" },
		{ mode = { "n", "x" }, keys = "`" },

		-- Registers
		{ mode = { "n", "x" }, keys = '"' },
		{ mode = { "i", "c" }, keys = "<C-r>" },

		-- Window commands
		{ mode = "n", keys = "<C-w>" },

		-- `z` key
		{ mode = { "n", "x" }, keys = "z" },
	},

	clues = {
		-- Enhance this by adding descriptions for <Leader> mapping groups
		miniclue.gen_clues.square_brackets(),
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
	},
})
