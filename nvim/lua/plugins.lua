local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
	-- Stop packer from trying to remove itself
	use { 'wbthomason/packer.nvim' }

	-- UI {{{
		use { 'famiu/feline.nvim', tag = 'v0.1' }
	-- }}}

	-- Misc {{{
		use { 'dstein64/vim-startuptime' }
	-- }}}
	

	-- Automatically install plugins after packer is installed
	if packer_bootstrap then
		require('packer').sync()
	end
end)
