local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
require('barbar').setup {
  {'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    keys = {
      map('n', '<Tab>', ':BufferNext<CR>', opts),
      map('n', '<S-Tab>', ':BufferPrev<CR>', opts),
    },
    buffer_index = 1,
    animation = true,
    opts = {
      mode = 'tabs',
      seperator = {'',left='',right=''},
      icons = {
      },
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  }
}
