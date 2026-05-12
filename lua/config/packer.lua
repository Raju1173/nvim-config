vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 
  {
    'nvim-telescope/telescope.nvim', version = '*',
    requires = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  }
  }
  
  use { "catppuccin/nvim", as = "catppuccin" }
  
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
  }

  use {
  'akinsho/bufferline.nvim',
  tag = "*",
  requires = 'nvim-tree/nvim-web-devicons'
  }

  use "mbbill/undotree"

  use "tpope/vim-fugitive"

  use 'nvim-tree/nvim-tree.lua'

  use 'neovim/nvim-lspconfig'

  use {
    "hrsh7th/nvim-cmp",
    requires = {
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
  }

  use { "lewis6991/gitsigns.nvim", 
	config = function()
        require('gitsigns').setup()
      end
  }

  use { 'nvim-lualine/lualine.nvim', 
	requires = { 'nvim-tree/nvim-web-devicons' }, 
	config = function()
	  require('lualine').setup({
	    options = { theme = 'dracula' }
	  })
      end
  }

  use { "folke/which-key.nvim", 
	config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup()
      end
  }
end)
