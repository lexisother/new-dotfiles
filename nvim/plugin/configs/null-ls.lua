local null_ls = require("null-ls")
local defaults = null_ls.builtins

null_ls.setup({
  debounce = 150,
  sources = {
    defaults.formatting.stylua.with({
      args = {
        "--config-path",
        vim.fn.stdpath("config") .. "/stylua.toml",
        "-",
      },
    }),
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWrite <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end,
})
