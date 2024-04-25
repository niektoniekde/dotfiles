return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true }}
  use({'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' }})
  use('mbbill/undotree')
  use 'lewis6991/gitsigns.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'maxmx03/solarized.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
			{'L3MON4D3/LuaSnip'},
    }
  }
end)

