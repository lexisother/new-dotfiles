local options = {
  completeopt = { "menuone", "noselect" },
  mouse = "a",
  foldmethod = "marker",

  expandtab = true,
  shiftwidth = 2,
  softtabstop = 2,
  tabstop = 2,

  number = true,
  cursorline = true,
}

local bufoptions = {
  undofile = true,
}

for o, _ in pairs(options) do
  vim.opt[o] = _
end

for o, _ in pairs(bufoptions) do
  vim.bo[o] = _
end

-- Run all the nvim-cmp configs
vim.cmd("runtime! dotfiles/lspconfigs/*.lua")
