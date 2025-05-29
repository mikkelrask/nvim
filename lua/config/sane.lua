--  Sane defaults
vim.g.mapleader           = '<Space>'
vim.g.maplocalleader      = '<Space>'

vim.o.clipboard           = "unnamedplus"
vim.opt.backspace         = '2'
vim.opt.autowrite         = true
vim.opt.number            = true
vim.wo.relativenumber     = true
vim.opt.smarttab          = true
vim.opt.tabstop           = 2
vim.opt.shiftwidth        = 2
vim.opt.laststatus        = 3
vim.opt.cursorline        = true
vim.opt.autoread          = true
vim.opt.hidden            = true
vim.opt.showmode          = true
vim.opt.showcmd           = true
vim.opt.termguicolors     = true

vim.opt.tabstop           = 2
vim.opt.shiftwidth        = 2
vim.opt.shiftround        = true
vim.opt.expandtab         = true
vim.opt.autoindent        = true
vim.opt.smartindent       = true
vim.opt.splitbelow        = true
vim.opt.splitright        = true
vim.opt.cindent           = true
vim.opt.smarttab          = true
vim.opt.hlsearch          = true
vim.opt.incsearch         = true
vim.opt.cul               = true
vim.opt.undodir           = vim.fn.expand('~/.config/nvim/.undo//')
vim.opt.undofile          = true
vim.opt.backupdir         = vim.fn.expand('~/.config/nvim/.backup//')

vim.opt.termguicolors     = true
vim.opt.ignorecase        = true
vim.opt.smartcase         = true
vim.opt.wrap              = false
vim.opt.mouse             = ''
--vim.api.nvim_set_hl(0, 'Comment', { italic=true, fg='#7f848e' })
-- This is not italic 
--vim.cmd[[colorscheme tokyonight]]
