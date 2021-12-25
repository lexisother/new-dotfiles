local lsp_installer = require("nvim-lsp-installer")

-- Automatically install the language servers
local lspservers = {
  "tsserver",
}
local install_path = vim.fn.stdpath("data") .. "/lsp_servers"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  for _, serv in ipairs(lspservers) do
    lsp_installer.install(serv)
  end
end

-- Set all of them up
lsp_installer.on_server_ready(function(server)
  local opts = {}

  server:setup(opts)
end)
