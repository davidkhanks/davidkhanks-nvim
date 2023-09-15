-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Theme(s)
  use 'navarasu/onedark.nvim'

  -- Fuzzy finder/searcher
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Syntax highlighting
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- File pinner
  use 'theprimeagen/harpoon'

  -- Keep track of undos
  use 'mbbill/undotree'

  -- Git utility
  use 'tpope/vim-fugitive'

  -- Git side bar markers
  use 'lewis6991/gitsigns.nvim'

  -- Git conflict visualizer
  use {
      'akinsho/git-conflict.nvim', 
      tag = "*", 
      config = function()
          require('git-conflict').setup()
      end
  }

  -- Toggles opposite values ie true -> false
  use { 'nguyenvukhang/nvim-toggler' }

  -- Language parser
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},         -- Required
		  {'hrsh7th/cmp-buffer'},       -- Required
		  {'hrsh7th/cmp-path'},         -- Optional
		  {'saadparwaiz1/cmp_luasnip'}, -- Optional
		  {'hrsh7th/cmp-nvim-lsp'},     -- Required
		  {'hrsh7th/cmp-nvim-lua'},     -- Required

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},              -- Required
		  {'rafamadriz/friendly-snippets'},  -- Required
	  }
  }

  -- Sidebar tree viewer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  -- Dressing up input windows
  use 'stevearc/dressing.nvim'

end)
