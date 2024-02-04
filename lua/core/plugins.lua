
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- If lazy.nvim is not installed, we clone itPress <CR> on a solution to accept
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  'wbthomason/packer.nvim',                                  -- Install packages with ease
  'ellisonleao/gruvbox.nvim',                                -- Make those colors groovejkjkjkjkjkkkk,
  -- "catppuccin/nvim",
  "rubixninja314/vim-mcfunction",
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
    "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  'nvim-lualine/lualine.nvim',                               -- That evil airline at the buttom
  'mbbill/undotree',                                         -- If CTRL-Z had git
  'tpope/vim-fugitive',                                      -- Actual git
  'christoomey/vim-tmux-navigator',                          -- Make tmux and nvim aware of each other, and share keymappings (i.e pane management)
  {'lukas-reineke/indent-blankline.nvim', main = "ibl", opts = {}},                     -- Visual lines to indicate indentation - also adds return cariage ligatures and visual spacing
  'edluffy/specs.nvim',
  {'echasnovski/mini.nvim', version = '*' },
  "jiangmiao/auto-pairs",
  -- CPM plugins - completion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'saadparwaiz1/cmp_luasnip',
  -- Snippets
  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',
  {
    'nvim-treesitter/nvim-treesitter',
    cmd = ':TSUpdate'
  },
  {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
  },
  {
      'notjedi/nvim-rooter.lua',
      config = function()
      end
  },
  {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    tag ='0.1.0',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  {
    "windwp/nvim-autopairs",
      config = function() 
        require("nvim-autopairs").setup {}
      end
  },
  {
    "github/copilot.vim"
  }
}
local opts = {

}
require("lazy").setup(plugins, opts)




