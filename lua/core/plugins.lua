
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- If lazy.nvim is not installed, we clone itPress <CR> on a solution to accept
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
  'ellisonleao/gruvbox.nvim',                                -- Make those colors gruuvy
  -- "catppuccin/nvim",
  -- "rubixninja314/vim-mcfunction",
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = true,
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
  {
    'lukas-reineke/indent-blankline.nvim', main = "ibl", opts = {}},                     -- Visual lines to indicate indentation - also adds return cariage ligatures and visual spacing
    'edluffy/specs.nvim',
  {
    'echasnovski/mini.nvim', version = '*'
  },
  "jiangmiao/auto-pairs",
  -- CPM plugins - completion
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  },
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  -- Snippets
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',
  {
    'nvim-treesitter/nvim-treesitter',
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      },
    opts = {
      render = "minimal", -- default, compact, minimal, simple
      stages = "fade", -- fade, fade_in_slide_out, slide, static
      timeout = 1000,
      top_down = true,

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
    tag ='0.1.5',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'BurntSushi/ripgrep',
      'sharkdp/fd'
  	}
  },
  {
    "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup {}
      end
  }
}
local opts = {
}
require("lazy").setup(plugins, opts)
