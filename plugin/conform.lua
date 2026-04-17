vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
	formatters_by_ft = {
		c = { lsp_format = "prefer" },
		cpp = { lsp_format = "prefer" },
		markdown = { lsp_format = "prefer" },
		lua = { "stylua" },
		python = { "ruff" },
		rust = { "rustfmt", lsp_format = "fallback" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 200,
		lsp_format = "fallback",
	},
})
