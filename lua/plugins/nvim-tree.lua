vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- Keymap for toggling nvim-tree
    vim.keymap.set("n", "<C-b>", function()
      vim.cmd.NvimTreeToggle()
      vim.cmd.MiniMapToggle()
    end, { silent = true, noremap = true, desc = "Toggle NvimTree" })
    -- Plugin setup
    require("nvim-tree").setup({
      disable_netrw = true,
      auto_reload_on_write = true,
      sort = {
        sorter = "name",
      },
      view = {
        width = 30,
        adaptive_size = true,
        side = "right"
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
    })
  end,
}
