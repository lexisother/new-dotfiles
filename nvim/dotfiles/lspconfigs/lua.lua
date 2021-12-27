local servers = require("nvim-lsp-installer.servers")
local utils = require("dotfiles.lsp.utils")

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local server_available, requested_server = servers.get_server("sumneko_lua")
if server_available then
  requested_server:on_ready(function()
    requested_server:setup({
      on_attach = utils.on_attach,
      settings = {
        Lua = {
          runtime = {
            path = runtime_path,
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })
  end)
  if not requested_server:is_installed() then
    requested_server:install()
  end
end
