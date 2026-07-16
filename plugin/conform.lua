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
		markdown = { "deno_fmt" },
		lua = { "stylua" },
		python = { "ruff" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "deno_fmt" },
		typescript = { "deno_fmt" },
		typescriptreact = { "deno_fmt" },
		html = { "deno_fmt" },
		css = { "deno_fmt" },
		astro = { "deno_fmt" },
		json = { "deno_fmt" },
		sh = { "shfmt" },
		toml = { lsp_format = "prefer" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 1500,
		lsp_format = "fallback",
	},
})
