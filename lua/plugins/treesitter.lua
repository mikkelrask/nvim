return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({ {
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
        hightlight = { enable = true },
        indent = { enable = true }
      } })
    end
  }
}
