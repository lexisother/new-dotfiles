local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
	-- Stop packer from trying to remove itself
	use { 'wbthomason/packer.nvim' }

	-- UI {{{
		use { 
			'tomasiser/vim-code-dark',
			config = function()
				vim.cmd("colorscheme codedark")
			end
			--'jacoborus/tender.vim',
			--config = function()
			--	vim.cmd("colorscheme tender")
			--end
		}
		use { 
			'famiu/feline.nvim',
			branch = 'develop',
			requires = {
				'kyazdani42/nvim-web-devicons'
			},
		}
		use {
			'lewis6991/gitsigns.nvim',
			requires = {
				'nvim-lua/plenary.nvim'
			},
		}
	-- }}}
	
	-- Editing {{{
		use { 'Raimondi/delimitMate' }
		use { 'neovim/nvim-lspconfig' }
		use { 'glepnir/lspsaga.nvim' }
		use { 'hrsh7th/nvim-cmp', branch = 'main' }
		use { 'hrsh7th/cmp-nvim-lsp', branch = 'main' }
		use { 'hrsh7th/cmp-buffer', branch = 'main' }
		use { 'hrsh7th/cmp-path', branch = 'main' }
		use { '' }
		use {
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate'
		}
	-- }}}

	-- Misc {{{
		use { 'dstein64/vim-startuptime' }
	-- }}}
	

	-- Automatically install plugins after packer is installed
	if packer_bootstrap then
		require('packer').sync()
	end
end)
