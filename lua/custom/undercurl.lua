vim.opt.mouse = ''
-- Allow undercurl to be used and called by nvim-treesitter
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
