vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  update_cwd = true,
  disable_netrw = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
  auto_reload_on_write = true,
  sort_by = "name",
  view = {
    adaptive_size = true,
    },
})

vim.keymap.set('n', '<c-b>', vim.cmd.NvimTreeFindFileToggle)
