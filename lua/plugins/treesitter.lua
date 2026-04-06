return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.config").setup({
        modules = {},
        ensure_installed = {
          "typescript",
          "c",
          "python",
          "lua",
          "javascript",
          "vim"
        },
        auto_install = false,
        sync_installed = true,
        highlight = { enable = true },
        indent = { enable = true }
      })
    end
  }
}
