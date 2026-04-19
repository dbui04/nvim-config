vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
	formatters = {
		injected = {
			options = {
				ignore_errors = true,
			},
		},
	},
	formatters_by_ft = {
		c = { lsp_format = "prefer" },
		cpp = { lsp_format = "prefer" },
		markdown = { "prettierd", "injected" },
		lua = { "stylua" },
		python = { "ruff" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "biome" },
		html = { "biome" },
		css = { "biome" },
		astro = { "biome" },
		json = { lsp_format = "prefer" },
		sh = { "shfmt" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 200,
		lsp_format = "fallback",
	},
})
