local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  -- Treesitter config
  ensure_installed = "maintained",

  -- Module config
  highlight = {
    enable = true,
  },
})
