local map = vim.keymap.set
return {
  'echasnovski/mini.nvim',
  config = function()
    local statusline = require('mini.statusline')
    local mini = require('mini.map')

    -- mini configuration
    mini.setup({
      integrations = {
        mini.gen_integration.builtin_search(),
        mini.gen_integration.gitsigns(),
        mini.gen_integration.diagnostic(),
      },
      symbols = {
        encode = nil, -- Use default encoding symbols (3x2 resolution)
        scroll_line = '-', -- Scrollbar for line representation
        scroll_view = '┃', -- Scrollbar for view representation
      },
      window = {
        focusable = false,             -- mini not focusable in normal mode
        side = 'right',                -- Position the mini on the right
        show_integration_count = true, -- Show integration counts
        width = 10,                    -- Set the width of the mini
        winblend = 25,                 -- Transparency level
        zindex = 10,                   -- Z-index
      },
    })

    -- MiniStatusline configuration
    statusline.setup({
      use_icons = true,
    })

    -- Create mini commands
    vim.api.nvim_create_user_command('MiniMapToggle', function() mini.toggle() end, {})
    vim.api.nvim_create_user_command('MiniMapEnable', function() mini.enable() end, {})
    vim.api.nvim_create_user_command('MiniMapDisable', function() mini.disable() end, {})

    -- Keybinding to toggle minimap manually
    map('n', '<leader>mm', ':MiniMapToggle<CR>', { desc = "Toggle minimap", noremap = true, silent = true })
    -- Autocommands to toggle minimap for specific file types
    vim.api.nvim_create_augroup("MiniMapAutoToggle", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      group = "MiniMapAutoToggle",
      pattern = { "typescript", "javascript", "python", "lua" }, -- Add or modify file types as needed
      callback = function()
        vim.cmd("MiniMapToggle")
      end,
    })
  end,
}
