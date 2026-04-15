vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
}

vim.lsp.enable('clangd')
vim.lsp.enable('lua_ls')
vim.lsp.enable('ty')
