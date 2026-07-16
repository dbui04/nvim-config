vim.pack.add({
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/jay-babu/mason-nvim-dap.nvim",
	{ src = "https://github.com/igorlfs/nvim-dap-view", version = vim.version.range("1.*") },
})

require("dap-view").setup({
	winbar = {
		sections = { "console", "watches", "scopes", "exceptions", "breakpoints", "threads", "repl" },
		default_section = "console",
	},
})

require("mason-nvim-dap").setup({
	ensure_installed = { "codelldb" },
	handlers = {},
})

vim.keymap.set("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })

vim.keymap.set("n", "<leader>dc", function()
	require("dap").continue()
end, { desc = "Continue" })
