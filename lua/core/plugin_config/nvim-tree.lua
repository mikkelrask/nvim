vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  auto_reload_on_write = true,
  sort_by = "name",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = 'u', action = 'dir_up' },
        { key = 'l', action = 'edit', action_cb = edit_or_open },
        { key = 's', action = 'vsplit_preview', action_cb = vsplit_preview },
        { key = 'h', action = 'close_node'},
        { key = 'H', action = 'collapse_all', action_cb = collapse_all },
      },
    },
  },
})

vim.keymap.set('n', '<c-b>', vim.cmd.NvimTreeFindFileToggle)
