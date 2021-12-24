-- Improve startup time + enable profiling data
require("impatient").enable_profile()

-- Prevent plugins from messing with this option
vim.o.termguicolors = true

-- <https://github.com/Vapourium/dotfiles/blob/2d72a54ef185d2386dd7085feae03fba5f13c8dd/etc/nvim/init.lua#L4-L15>
local init_modules = {
  "dotfiles.configs.feline",
  "dotfiles.configs.cmp",
  "dotfiles.configs.treesitter",
  "dotfiles.configs.null-ls",
}

for _, module in ipairs(init_modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
  end
end
