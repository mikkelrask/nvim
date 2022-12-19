require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "javascript", "vim" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
