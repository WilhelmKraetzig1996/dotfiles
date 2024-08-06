require("mason").setup()
require('mason-tool-installer').setup {
  ensure_installed = {"black", 'cmake-language-server', 'lua-language-server', 'bash-language-server',},
}
require("mason-lspconfig").setup{
    ensure_installed = {"pylsp", "clangd"},
}
