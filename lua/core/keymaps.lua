local map = vim.keymap.set
local opts = { silent = true }
local cmd = vim.cmd

-- Move windows
map('n', '<C-j>', '<C-w>j<CR>', opts)
map('n', '<C-k>', '<C-w>k<CR>', opts)
map('n', '<C-h>', '<C-w>h<CR>', opts)
map('n', '<C-l>', '<C-w>l<CR>', opts)
map('n', '<C-r>j', ':resize -2<CR>', opts)
map('n', '<C-r>k', ':resize +2<CR>', opts)
map('n', '<C-r>h', ':vertical resize +2<CR>', opts)
map('n', '<C-r>l', ':vertical resize -2<CR>', opts)

-- Splits
map('n', 'ss',':below wincmd f<CR>', opts)
map('n', 'sv', ':below wincmd f<CR>', opts)

-- New tab
map('n', '<C-t>', cmd.tabedit, opts)

-- Tabs (next, prev, close, save and close)
map('n', '<Tab>', cmd.BufferNext, {
  noremap       = true,
  silent        = true,
  }
)
map('n', '<S-Tab>', cmd.BufferPrevious, {
  noremap       = true,
  silent        = true,
  }
)
map('n', '<C-w>', cmd.tabclose, {
  noremap       = true,
  silent        = true
  }
)

-- x should not yank
map('n', 'x', '<Del>', opts)

-- Update packages
map('n', '<leader>p', ':PackerSync<CR>', opts)

-- Remove search highlights
map('n', '<leader>h', cmd.nohlsearch, opts)
