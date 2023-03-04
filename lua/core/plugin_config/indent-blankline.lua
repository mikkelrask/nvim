vim.cmd([[highlight IndentHighlightListBlank1 guifg=#cba6f7 gui=nocombine]])
vim.cmd([[highlight IndentHighlightListBlank2 guifg=#f38ba8 gui=nocombine]])
vim.cmd([[highlight IndentHighlightListBlank3 guifg=#fab387 gui=nocombine]])
vim.cmd([[highlight IndentHighlightListBlank4 guifg=#f9e2af gui=nocombine]])
vim.cmd([[highlight IndentHighlightListBlank5 guifg=#94e2d5 gui=nocombine]])
vim.cmd([[highlight IndentHighlightListBlank6 guifg=#74c7ec gui=nocombine]])

vim.opt.termguicolors = true

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"


require('indent_blankline').setup {
    show_end_of_line = true,
    space_char_blankline = " ",
    show_currnt_context = true,
    show_currnt_context_start = true,
  char_highlight_list = {
    "IndentHighlightListBlank1",
    "IndentHighlightListBlank2",
    "IndentHighlightListBlank3",
    "IndentHighlightListBlank4",
    "IndentHighlightListBlank5",
    "IndentHighlightListBlank6",
  },
}
