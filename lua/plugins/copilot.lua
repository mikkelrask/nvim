return {
  'zbirenbaum/copilot.lua',
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require('copilot').setup({
      suggestion = {
        enabled = true
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
  end
}
