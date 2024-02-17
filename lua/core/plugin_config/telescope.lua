local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local builtin = require('telescope.builtin')

return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 
        'nvim-lua/plenary.nvim',
        'BurntSushi/ripgrep',
        'sharkdp/fd'
      },
      keys = {
        -- Telescope diagnostics
        map('n', '<leader>DD', [[Telescope diagnostics]], opts)

      },
      opts = {

      }
}

