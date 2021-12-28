local M = require("dotfiles.autoload")("dotfiles.utils.vim")

function M.normalize_bufnr(bufnr)
  if bufnr == nil or bufnr == 0 then
    return vim.api.nvim_get_current_buf()
  else
    return bufnr
  end
end

return M
