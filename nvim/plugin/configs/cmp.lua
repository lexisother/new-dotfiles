local cmp = require("cmp")

-- <https://github.com/dmitmel/dotfiles/blob/d40d79699c3f8c9b1e4724dd52e46fc221952477/nvim/lua/dotfiles/completion.lua#L41>
-- TODO: Add buffer source
cmp.setup({
	experimental = {
		native_menu = true
	},
	sources = {
		{
			name = 'nvim_lsp',
			menu_label = function(source)
				local result = 'LS'
				local client = source and source.source and source.source.client
				if client then
					local label = client.config and client.config.completion_menu_label
					if label then
						result = result .. '/' .. label
					end
				end
				return result
			end
		},
		{
			name = 'path',
			menu_label = 'Path'
		}
	},
	completion = {
		keyword_pattern = [[\k\+]],
		completeopt = vim.o.completeopt
	},
	preselect = cmp.PreselectMode.None,
	confirmation = {
		default_behavior = cmp.ConfirmBehavior.Replace
	},
	documentation = true,
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
		      	cmp.config.compare.score,
		      	-- cmp.config.compare.kind,
		      	cmp.config.compare.sort_text,
		      	-- cmp.config.compare.length,
		      	cmp.config.compare.order,
	    	},
	},
	formatting = {
		deprecated = false,
	}
})