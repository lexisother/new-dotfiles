local M = require("dotfiles.autoload")("dotfiles.lsp.utils")
local lsp = require("vim.lsp")
local vim_utils = require("dotfiles.utils.vim")

function M.on_attach(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  local opts = { noremap = true, silent = true }

  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua nvim.lsp.buf.references()<CR>", opts)
end

---@see https://github.com/neovim/neovim/blob/9625832372e77c8a15f6ebb30df4fcbb6aba6fe8/runtime/lua/vim/lsp/util.lua#L1854-L1861
function lsp.util.make_text_document_params(bufnr)
  return { uri = vim.uri_from_bufnr(bufnr or 0) }
end

function M.make_versioned_text_document_params(bufnr)
  bufnr = vim_utils.normalize_bufnr(bufnr)
  local result = lsp.util.make_text_document_params(bufnr)
  result.version = lsp.util.buf_versions[bufnr]
  return result
end

return M
