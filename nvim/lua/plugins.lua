local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Atom theme
  use 'navarasu/onedark.nvim'
  -- nice and cool bar status for vim
	use 'kyazdani42/nvim-web-devicons'
  use {
   'nvim-lualine/lualine.nvim',
   requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use 'onsails/lspkind.nvim'
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  -- autocomplete tools
	use 'L3MON4D3/LuaSnip'
	use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use 'nvim-treesitter/nvim-treesitter'
  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs'
	-- file finder
	use {
  	'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use { "nvim-telescope/telescope-file-browser.nvim" }
	use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	use 'glepnir/lspsaga.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'MunifTanjim/eslint.nvim'
  -- fancy stuff for git
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use  'norcalli/nvim-colorizer.lua'
  use 'MunifTanjim/prettier.nvim'
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons'}}
  use 'simrat39/rust-tools.nvim'
  use {'mfussenegger/nvim-dap', requires = 'nvim-lua/plenary.nvim' }

end)

