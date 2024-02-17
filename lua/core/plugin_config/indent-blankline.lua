vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

local highlight = {
  "CursorColumn",
  "Whitespace",
  "EndOfBuffer",
}
require("ibl").setup {
  indent = {
    highlight = { "Function", "Label" },
    smart_indent_cap = true,
    char = '┊'
  },
  whitespace = {
    highlight = {
      'Whitespace',
      'NonText',
      'Function',
      'Label'
    },
    remove_blankline_trail = false
  },
  scope = {
    enabled = true,
    show_end = true,
    show_exact_scope = true
  }
}
