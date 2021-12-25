local cmp = require("cmp")
local snippy = require("snippy")

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

snippy.setup({})

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
    ["<Tab>"] = (function(default_mapping_func)
      return cmp.mapping(function(fallback)
        local selected_entry = cmp.get_selected_entry()
        if not selected_entry and snippy.can_jump(1) then
          snippy.next()
        else
          default_mapping_func(fallback)
        end
      end, { "i", "s" })
    end)(cmp.mapping.select_next_item()),

    ["<S-Tab>"] = (function(default_mapping_func)
      return cmp.mapping(function(fallback)
        local selected_entry = cmp.get_selected_entry()
        if not selected_entry and snippy.can_jump(-1) then
          snippy.previous()
        else
          default_mapping_func(fallback)
        end
      end, { "i", "s" })
    end)(cmp.mapping.select_prev_item()),
  },
  snippet = {
    expand = function(args)
      snippy.expand_snippet(args.body)
    end,
  },
  sources = {
    { name = "buffer" },
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "snippy" },
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
