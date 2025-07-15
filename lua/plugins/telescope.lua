local map = vim.keymap.set
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    'sharkdp/fd',
  },
  config = function()
    require('telescope.builtin')
    map('n', '<leader>bb', ':Telescope buffers<CR>', -- Fuzzy find open buffers
      {
        desc    = "Fuzzy find currently active buffers",
        noremap = true,
        silent  = true
      })
    map('n', '<leader>fb', ':Telescope buffers<CR>', -- "Fuzzy find open buffer"
      {
        desc    = "Fuzzy find currently active buffers",
        noremap = true,
        silent  = true
      })

    -- Search in project
    map('n', '<leader>ff', ':Telescope find_files<CR>', -- Fuzzy find files
      {
        desc    = "Fuzzy find files within current project directory",
        noremap = true,
        silent  = true
      })
    map('n', '<leader>fg', ':Telescope live_grep<CR>', -- Fuzzy search words in files (grep)
      {
        desc    = "Fuzzy find text (grep) within files in the current project directory",
        noremap = true,
        silent  = true
      })
    map('n', '<leader>fh', ':Telescope help_tags<CR>', -- Get help
      {
        desc    = "Search help pages",
        noremap = true,
        silent  = true
      })
    map('n', '<leader>DD', ':Telescope diagnostics<CR>',
      {
        desc = "Diagnostics (CTRL+q to add to quicklist)",
        noremap = true,
        silent = true
      })
    map('n', '<leader>fr', require('telescope.builtin').lsp_references, {
        desc = "LSP Reference",
        noremap = true,
        silent = true
      })
    -- NVIM Config
    map('n', '<leader>en', function()
        require('telescope.builtin').find_files { -- Fuzzy find files inside of ~/.config/nvim
          cwd = vim.fn.stdpath('config')
        }
      end,
      {
        desc = "Settings: Neovim dotfiles",
        noremap = true,
        silent = true
      }
    )
    map('n', '<leader>CS', ':Telescope colorschemes<CR>',
      {
        desc = "Pick a colorscheme. Will be reset in next session",
        noremap = true,
        silent = true
      }
    )
  end,
}
