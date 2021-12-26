local lsp_installer = require("nvim-lsp-installer")

-- Whichever server has `1` set as its value, is manually set up in another
-- file, so the `on_server_ready` callback won't become cluttered with `if
-- server.name ==` to specify custom opts.
local lspservers = {
  ["tsserver"] = 0,
  ["sumneko_lua"] = 1,
}

-- Automatically install the language servers
local install_path = vim.fn.stdpath("data") .. "/lsp_servers"
for serv, _ in pairs(lspservers) do
  if vim.fn.empty(vim.fn.glob(install_path .. "/" .. serv)) > 0 then
    lsp_installer.install(serv)
  else
    return
  end
end

-- Set all of them up
lsp_installer.on_server_ready(function(server)
  local opts = {}

  if lspservers[server.name] == 1 then
    return
  else
    server:setup(opts)
  end
end)
