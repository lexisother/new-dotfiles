-- Indent lines {{{

-- Set up the colors
vim.cmd("highlight IndentLineColor guifg=red")

local ilines = vim.api.nvim_create_namespace("miniguide")
local function on_win(_, _, bufnr, _)
  if bufnr ~= vim.api.nvim_get_current_buf() then
    return false -- FAIL
  end
end

local function on_line(_, _, bufnr, row)
  local indent = vim.fn.indent(row + 1)
  for i = 1, indent - 1, 2 do
    vim.api.nvim_buf_set_extmark(bufnr, ilines, row, i - 1, {
      virt_text = { { "│", "IndentLineColor" } },
      virt_text_pos = "overlay",
      ephemeral = true,
    })
    if tata then
      ree = re
    end
  end
end
vim.api.nvim_set_decoration_provider(ilines, { on_win = on_win, on_line = on_line })
-- }}}
