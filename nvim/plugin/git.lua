local gitsigns = require("gitsigns")

local gitgutter_sign_priority = 9

-- <https://github.com/airblade/vim-gitgutter/blob/42ed714fb9268329f652e053d1de996c77581694/plugin/gitgutter.vim#L48-L59>
local gitgutter_sign_added = "+"
local gitgutter_sign_modified = "~"
local gitgutter_sign_removed = "_"
local gitgutter_sign_removed_first_line = "‾"
local gitgutter_sign_removed_above_and_below = gitgutter_sign_removed
  .. gitgutter_sign_removed_first_line
local gitgutter_sign_modified_removed = gitgutter_sign_modified .. gitgutter_sign_removed

-- <https://github.com/dmitmel/dotfiles/blob/fbcd93b2a820df633b9b62dff53e442dd126b279/nvim/plugin/git.vim#L30>
gitsigns.setup({
  signs = {
    add = { text = gitgutter_sign_added },
    delete = { text = gitgutter_sign_removed },
    topdelete = { text = gitgutter_sign_removed_first_line },
    change = { text = gitgutter_sign_modified },
    changedelete = { text = gitgutter_sign_modified_removed },
  },
  sign_priority = gitgutter_sign_priority,
  preview_config = {
    border = "none",
    col = 0,
    row = 1,
  },
  keymaps = {},
})
