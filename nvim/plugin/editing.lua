-- These have to be configured manually, apparently
vim.g.delimitMate_expand_space = 1
vim.g.delimitMate_expand_cr = 1

-- Keybinds
function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { silent = true })
