local lspconfig = require("lspconfig")
local utils = require("dotfiles.lsp.utils")

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup({
	on_attach = utils.on_attach,
	settings = {
		Lua = {
			runtime = {
				path = runtime_path
			},
			diagnostics = {
				globals = {"vim"}
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true)
			},
			telemetry = {
				enable = false
			}
		}
	}

})
