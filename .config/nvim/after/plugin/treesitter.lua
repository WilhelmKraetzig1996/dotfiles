require'nvim-treesitter.configs'.setup {
  ensure_installed = { "cpp", "python", "javascript", "c", "lua", "markdown", "markdown_inline"},
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}
