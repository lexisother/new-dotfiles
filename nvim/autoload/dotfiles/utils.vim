function! dotfiles#utils#undo_ftplugin_hook(cmd) abort
	if exists("b:undo_ftplugin")
		let b:undo_ftplugin .= ' | ' . a:cmd
	else
		let b:undo_ftplugin = a:cmd
	endif
endfunction
