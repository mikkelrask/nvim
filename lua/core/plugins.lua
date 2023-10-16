local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
require('packer').init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded'}
    end
  }
}

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'                                  -- Install packages with ease
--  use 'ellisonleao/gruvbox.nvim'                                -- Make those colors groovejkjkjkjkjkkkk
  use "catppuccin/nvim"
  use "rubixninja314/vim-mcfunction"
  use 'nvim-tree/nvim-tree.lua'                                 -- Nerd tree but lua'd
  use 'nvim-tree/nvim-web-devicons'                             -- Icons for file tree, LSP icons and tabicons
  use 'nvim-lualine/lualine.nvim'                               -- That evil airline at the buttom
  use 'mbbill/undotree'                                         -- If CTRL-Z had git
  use 'tpope/vim-fugitive'                                      -- Actual git
  use 'christoomey/vim-tmux-navigator'                          -- Make tmux and nvim aware of each other, and share keymappings (i.e pane management)
  use 'lukas-reineke/indent-blankline.nvim'                     -- Visual lines to indicate indentation - also adds return cariage ligatures and visual spacing
  use 'edluffy/specs.nvim'
  use {'echasnovski/mini.map', config = function()
	  require('mini.map').setup({})
	  end
	}
  use 'jiangmiao/auto-pairs'                                    -- Auto close and auto delete brackets, parantheses and quotes in pairs.
  -- CPM plugins - completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}
  use {
      'notjedi/nvim-rooter.lua',
      config = function()
        require'nvim-rooter'.setup()
      end
  }
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })
  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    tag ='0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }
  use {
    "github/copilot.vim"
  }
end)
