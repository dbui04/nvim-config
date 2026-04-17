vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
vim.lsp.enable("ty")

local capabilities = vim.lsp.protocol.make_client_capabilities()
vim.lsp.config("markdown_oxide", {
	-- Ensure that dynamicRegistration is enabled! This allows the LS to take into account actions like the
	-- Create Unresolved File code action, resolving completions for unindexed code blocks, ...
	capabilities = vim.tbl_deep_extend("force", capabilities, {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
	}),
})
vim.lsp.enable("markdown_oxide")
