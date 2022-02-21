local servers = require("nvim-lsp-installer.servers")
local utils = require("dotfiles.lsp.utils")

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local server_available, requested_server = servers.get_server("sumneko_lua")
if server_available then
  requested_server:on_ready(function()
    requested_server:setup({
      on_attach = function(client, bufnr)
        utils.on_attach(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
      end,
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
