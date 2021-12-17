local saga = require('lspsaga')

vim.cmd("nnoremap <silent>K :Lspsaga hover_doc<CR>")

saga.init_lsp_saga {
	error_sign = 'XX',
	warn_sign = '!!',
	hint_sign = '>>',
	infor_sign = '>>',
	border_style = 'round'
}
