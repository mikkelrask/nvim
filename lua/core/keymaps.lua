local map = vim.keymap.set
local opts = {
  noremap = true,
  silent = true
}
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

-- linebreak without leaving normal mode
map('n', '<leader>oo', 'o<Esc>', opts)

-- move lines up and down
map('n', '<leader>jj', ':m .+1<CR>==', opts)
-- source document
--map('n', '<leader>so', ':so %<CR>', {print('🚀 To the moon!\n   File reloaded!')})

-- Resize Splits
-- New tab
map('n', '<C-t>', cmd.tabedit, opts)

-- Buffers
map('n', '<Tab>', ':bnext<CR>', opts)
map('n', '<S-Tab>', ':bprev<CR>', opts)
map('n', '<leader>bb', ':Telescope buffers<CR>', opts)

-- Search in project
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<leader>fh', ':Telescope help_tags<CR>', opts)

-- visual block
map('n',"'", "ciw''<ESC>p", opts )
map('v', "'", [[:s/\%V'\%V/'/g<CR>``<]], opts)

-- global replace
map('n', '<leader>rr', [[:%s/\V<C-R>=escape(expand('<cword>'), '/\')<CR>//g<Left><Left>]], opts)

map('n', '<C-w>', cmd.tabclose, {
  noremap       = true,
  silent        = true
  }
)


-- cursor line
map('n', '<C><C>', ':lua require("specs").show_specs()<CR>')

-- x should nohjkjkjt yank
map('n', 'x', '<Del>', opts)

-- Update packageskjkjkjkkkkkk  
map('n', ' p', ':Lazy update<CR>', {
  noremap       = true,
  silent        = true
})

-- bun build with leader ææ

local function bun_build()
  vim.cmd('!tmux send -t 2 "bun run build" Enter')
  print('building in pane #2...')
end

map('n', '<leader>ææ', bun_build, {
  noremap       = true,
  silent        = true
})

-- Remove search highlights
map('n', ' h', cmd.nohlsearch, opts)
