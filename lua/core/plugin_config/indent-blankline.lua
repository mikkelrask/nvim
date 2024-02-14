vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

local highlight = {
    "CursorColumn",
    "Whitespace",
}
require("ibl").setup {
  indent = {
    highlight = highlight,
    char = '┊'
  },
  whitespace = {
    highlight = {
      'Whitespace',
      'NonText',
      'Function',
      'Label'
    },
    remove_blankline_trail = true
  },
  scope = {
    enabled = true
  }
}
