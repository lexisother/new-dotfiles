local servers = require("nvim-lsp-installer.servers")
local lsp_utils = require("dotfiles.lsp.utils")

local function eslint_fix_all(bufnr)
  vim.lsp.buf_request_sync(bufnr, "workspace/executeCommand", {
    command = "eslint.applyAllFixes",
    arguments = { lsp_utils.make_versioned_text_document_params(bufnr) },
  })
end

local server_available, requested_server = servers.get_server("eslint")
if server_available then
  requested_server:on_ready(function()
    requested_server:setup({
      commands = {
        LspEslintFixAll = {
          function()
            return eslint_fix_all(vim.api.nvim_get_current_buf())
          end,
        },
      },
    })
  end)
  if not requested_server:is_installed() then
    requested_server:install()
  end
end

function _G.dotfiles._lsp_eslint_bufwritepre()
  local bufnr = vim.api.nvim_get_current_buf()
  for _, client in ipairs(vim.lsp.buf_get_clients(bufnr)) do
    if client.name == "eslint" then
      eslint_fix_all(vim.api.nvim_get_current_buf())
    end
  end
end

-- Add an autocommand to BufWritePre so all auto-fixable errors are fixed prior
-- to saving
vim.cmd([[
  augroup dotfiles_lsp_eslint
    autocmd!
    autocmd BufWritePre * call v:lua.dotfiles._lsp_eslint_bufwritepre()
  augroup END
]])
