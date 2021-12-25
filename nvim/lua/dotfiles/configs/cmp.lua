local cmp = require("cmp")
local luasnip = require("luasnip")

-- A table used for completion menu icons
local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Set up nvim-cmp
-- <https://github.com/dmitmel/dotfiles/blob/d40d79699c3f8c9b1e4724dd52e46fc221952477/nvim/lua/dotfiles/completion.lua#L41>
-- TODO: Add buffer source
cmp.setup({
  formatting = {
    deprecated = false,
    fields = { "kind", "abbr" },
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
      return vim_item
    end,
  },
  mapping = {
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "buffer" },
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
  },
})

-- old config {{{
-- cmp.setup({
--   experimental = {
--     native_menu = true,
--   },
--   sources = {
--     {
--       name = "nvim_lsp",
--       menu_label = function(source)
--         local result = "LS"
--         local client = source and source.source and source.source.client
--         if client then
--           local label = client.config and client.config.completion_menu_label
--           if label then
--             result = result .. "/" .. label
--           end
--         end
--         return result
--       end,
--     },
--     {
--       name = "path",
--       menu_label = "Path",
--     },
--   },
--   completion = {
--     keyword_pattern = [[\k\+]],
--     completeopt = vim.o.completeopt,
--   },
--   preselect = cmp.PreselectMode.None,
--   confirmation = {
--     default_behavior = cmp.ConfirmBehavior.Replace,
--   },
--   documentation = true,
--   sorting = {
--     comparators = {
--       cmp.config.compare.offset,
--       cmp.config.compare.exact,
--       cmp.config.compare.score,
--       -- cmp.config.compare.kind,
--       cmp.config.compare.sort_text,
--       -- cmp.config.compare.length,
--       cmp.config.compare.order,
--     },
--   },
--   formatting = {
--     deprecated = false,
--     fields = { "kind", "abbr" },
--     format = function(entry, vim_item)
--       vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
--       return vim_item
--     end,
--   },
-- })
-- }}}
