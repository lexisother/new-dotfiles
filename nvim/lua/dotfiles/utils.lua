local M = require('dotfiles.autoload')('dotfiles.utils')

-- <https://github.com/dmitmel/dotfiles/blob/b023ce0774c13d1daab5cf638681f7405d5a8fe8/nvim/lua/dotfiles/utils.lua#L306-L318>
function M.script_path()
	local str = debug.getinfo(2, 'S').source
	if str:sub(1, 1) == "@" then
		return str:sub(2)
	else
		return nil
	end
end


return M
