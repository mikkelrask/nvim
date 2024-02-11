local map = vim.keymap.set
local opts = { silent = true }
local cmd = vim.cmd
-- set leader to space
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

  -- Move windows
map('n', '<C-j>', '<C-w>j<CR>', opts)
map('n', '<C-k>', '<C-w>k<CR>', opts)
map('n', '<C-h>', '<C-w>h<CR>', opts)
map('n', '<C-l>', '<C-w>l<CR>', opts)
map('n', '<C-r>j', ':resize -2vv<CR>', opts)
map('n', '<C-r>k', ':resize +2<CR>', opts)
map('n', '<C-r>h', ':vertical resize +2<CR>', opts)
map('n', '<C-r>l', ':vertical resize -2<CR>', opts)

-- Splits
map('n', 'ss',':below wincmd f<CR>', opts)
map('n', 'sv', ':below wincmd f<CR>', opts)

-- Resize Splits
-- New tab
map('n', '<C-t>', cmd.tabedit, opts)


-- Search in project
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<leader>fh', ':Telescope help_tags<CR>', opts)


map('n', '<C-w>', cmd.tabclose, {
  noremap       = true,
  silent        = true
  }
)

-- cursor line
map('n', '<C><C>', ':lua require("specs").show_specs()<CR>')

-- x should not yank
map('n', 'x', '<Del>', opts)

-- Update packages
map('n', ' p', ':Lazy update<CR>', {
  noremap       = true,
  silent        = true
})


-- Remove search highlights
map('n', ' h', cmd.nohlsearch, opts)
-- j
-- Build Pio project
map('n', ' b',':!pio run<CR>', {silent=false})
