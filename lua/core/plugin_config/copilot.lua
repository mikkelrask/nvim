require('copilot_cmp').setup({
  panel = {
    enabled = true,
    auto_refresh = true,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<Tab>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "right", -- | top | left | right
      ratio = 0.45
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<C-CR>",
      accept_word = false,
      accept_line = false,
      next = "<M-.>",
      prev = "<M-[>",
      dismiss = "<C-BS>",
    },
  },
  filetypes = {
    tsx = true,
    jsx = true,
    py = true,
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 18.x
  server_opts_overrides = {},
})
