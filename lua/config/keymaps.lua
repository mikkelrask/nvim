local map = vim.keymap.set
local cmd = vim.cmd
-- set leader to space
vim.g.mapleader = ' '
map('n', '<Space>', '',
  {
    desc = "Leader key"
  })

-- Splits
map('n', 'ss', ':below wincmd f<CR>',
  {
    desc = "If the cursor is on top of a file name, of a file present in the same cwd, open the file in a split pane",
    noremap = true,
    silent = true
  })
map('n', 'sv', ':below wincmd f<CR>',
  {
    desc = "If the cursor is on top of a file name, of a file present in the same cwd, open the file in a vertical split",
    noremap = true,
    silent = true
  })

-- Line manipulation
map('n', '<leader>o', 'o<Esc>',
  {
    desc = "Create a newline and go to it, without entering insert mode",
    noremap = true,
    silent = true
  })
map('n', '<leader>jj', ':m .+1<CR>==',
  {
    desc    = "Move active line down by 1",
    noremap = true,
    silent  = true
  })
map('n', '<leader>kk', ':m .-2<CR>==',
  {
    desc    = "Move current line up by 1",
    noremap = true,
    silent  = true
  })

-- Tab
map('n', '<C-t>', cmd.tabedit, -- New tab
  {
    desc    = "Open a new tab",
    noremap = true,
    silent  = true
  })
map('n', '<C-w>', cmd.tabclose, { -- Close tab
  desc    = "Closes current tab",
  noremap = true,
  silent  = true
})

-- Buffers
map('n', '<Tab>', ':bnext<CR>', -- Next buffer
  {
    desc    = "Cycle to next open buffer",
    noremap = true,
    silent  = true
  })
map('n', '<S-Tab>', ':bprev<CR>', -- Previous buffer
  {
    desc    = "Cycle to previous open buffer",
    noremap = true,
    silent  = true
  })

-- "'visual'" 'bloc' 'quotes'
map('n', "<leader>'", "ciw''<ESC>hp",
  { desc = "Wraps currently marked word with 'single quotes'", noremap = true, silent = true })
map('v', "<leader>'", [[:s/\%V'\%V/'/g<CR>``<]],
  { desc = "Wraps currently marked text with 'single quotes'", noremap = true, silent = true })
map('n', '<leader>"', 'ciw""<ESC>hp',
  { desc = 'Wraps currently marked word with "double quotes"', noremap = true, silent = true })
map('v', '<leader>"', [[:s/\%V"\%V/"/g<CR>``<]],
  { desc = 'Wraps currently marked text with "double quotes"', noremap = true, silent = true })

-- global replace
map('n', '<leader>rr', [[:%s/\V<C-R>=escape(expand('<cword>'), '/\')<CR>//g<Left><Left>]], {
  desc    = "Rename the word below the curser and replace for current buffer",
  noremap = true,
  silent  = true
})


map("n", "<leader>w", ":w<CR>", { -- Like ':w' but with space instead of ':' 🤷
  desc = "Writes current buffer to file",
  noremap = true,
  silent = true
})
map("n", "<leader>wq", ":wq<CR>", { -- Like ':wq' but with space instead of ':' 💪
  desc = "Writes and quit without command mode",
  noremap = true,
  silent = true
})
map("n", "<leader><leader>q", ":q<CR>", {
  desc = "Quit nvim",
  noremap = true,
  silent = true
})
map("n", "<leader><leader>qq", ":q!<CR>", {
  desc = "Quit NVIM and discard unsaved changes",
  noremap = true,
  silent = true
})

-- x should not yank
map('n', 'x', '<Del>', {
  desc    = "Uses delete as 'x'/cut preventing x'd word or characters from filling your paste buffer",
  noremap = true,
  silent  = true
})

-- Quick lists
map('n', '<leader><C-j>', ":cnext<CR>", { -- Next entry
  desc = "Go to next quick list entry",
  noremap = true,
  silent = true
})
map("n", "<leader><C-k>", ":cprev<CR>", { -- Previous entry
  desc = "Go to previous quick list entry",
  noremap = true,
  silent = true
})

-- Remove search highlights
map('n', ' h', cmd.nohlsearch, {
  desc = "Removes any search hightlighted words",
  noremap = true,
  silent = true
})

-- Execute current line or marked text with leader + x
map('n', '<leader>x', ':.lua<CR>', {
  desc = "Execute the marked line with Lua inside the current Neovim buffer",
  noremap = true,
  silent = true
})
map('v', '<leader>x', ':lua<CR>', {
  desc = "Execute the currently marked text with Lua inside the current Neovim buffer",
  noremap = true,
  silent = true
})

-- Source current file
map('n', '<leader>so', ':so %<CR>',
  {
    desc    = "Source the current file inside Neovim",
    silent  = true,
    noremap = true,
  })

map('n', '<leader><leader>x', function()
  vim.cmd("source %")
  print "sauce'd"
end, {
  desc = "Source the current file inside Neovim",
  noremap = true,
  silent = true,
})

-- Move windows
map('n', '<C-j>', '<C-w>j<CR>', {
  desc = "Go to the window below (nvim windows/tmux panes)",
  noremap = true,
  silent = true
})
map('n', '<C-k>', '<C-w>k<CR>', {
  desc = "Go to the window above (nvim windows/tmux panes)",
  noremap = true,
  silent = true
})
map('n', '<C-h>', '<C-w>h<CR>', {
  desc = "Go to the left window (nvim windows/tmux panes)",
  noremap = true,
  silent = true
})
map('n', '<C-l>', '<C-w>l<CR>', {
  desc = "Go to the right window (nvim windows/tmux panes)",
  noremap = true,
  silent = true
})
map('n', '<C-r>j', ':resize -2vv<CR>', {
  desc = "Make current window smaller (nvim windows/tmux panes)",
  noremap = true,
  silent = true
})
map('n', '<C-r>k', ':resize +2<CR>', {
  desc = "Make current window bigger (nvim windows/tmux panes)",
  noremap = true,
  silent = true
})
map('n', '<C-r>h', ':vertical resize +2<CR>', {
  desc = "Make current window taller (nvim windows/tmux panes)",
  noremap = true,
  silent = true
})
map('n', '<C-r>l', ':vertical resize -2<CR>', {
  desc = "Make current window shorter (nvim windows/tmux panes)",
  noremap = true,
  silent = true
})
