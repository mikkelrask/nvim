require("copilot").setup({
  suggestion = {
    enabled = false
  },
  panel = {
    enabled = false
  },
  config = {
    keymap = {
      next = "<C-j>",
      prev = "<C-k>",
      select = "<CR>",
      close = "<C-e>",
      quit = "<C-q>"
    }
  }
})
