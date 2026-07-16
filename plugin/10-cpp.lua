vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--background-index",
		"--j=" .. math.max(1, (tonumber(vim.fn.system("nproc")) or 2) - 1),
		"--header-insertion=iwyu",
		"--clang-tidy",
		"--completion-style=detailed",
	},
})
