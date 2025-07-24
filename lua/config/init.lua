local map = vim.keymap.set
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit.." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.runtimepath:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    for _, group in ipairs({
      "Normal", "NormalNC",
      "TelescopeNormal", "TelescopeBorder",
      "SignColumn", "MsgArea", "LineNr", "EndOfBuffer"
    }) do
      vim.api.nvim_set_hl(0, group, { bg = "none" })
    end
  end,
})

require('lazy').setup({
  spec = {
    {
      "folke/tokyonight.nvim",
      priority = 1000, -- ensure it's loaded before anything else
      opts = {
        style = "night",           -- "storm", "night", "moon", or "day"
        transparent = false,
        terminal_colors = true,
        styles = {
        },
      },
      init = function()
        vim.cmd("colorscheme tokyonight")
      end,
    },
    { import = "plugins" },
  },

  -- Update packages
  map('n', ' p', ':Lazy update<CR>', {
    desc    = "Update Neovim packages with Lazy",
    noremap = true,
    silent  = true
  }),
  checker = { enabled = true },
})
