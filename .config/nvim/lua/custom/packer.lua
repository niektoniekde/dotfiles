return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim', run = ':PackerSync' }
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true }}
  use({'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' }})
  use('mbbill/undotree')
  use 'lewis6991/gitsigns.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use ({
    'MeanderingProgrammer/render-markdown.nvim',
    after = { 'nvim-treesitter' },
    -- requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
    -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
    requires = { 'nvim-tree/nvim-web-devicons', opt = true } -- if you prefer nvim-web-devicons
  })
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'tpope/vim-fugitive'}
  use 'maxmx03/solarized.nvim'
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

