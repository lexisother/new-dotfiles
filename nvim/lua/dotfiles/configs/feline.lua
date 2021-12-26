local feline = require("feline")
local defaultpreset = require("feline.presets.default")

-- Why is that block colored?
defaultpreset.active[1][1] = {
  provider = "▊ ",
  hl = {
    fg = "bg",
  },
}

-- The default config has a terrible looking UI for the Git stuff. So, off to
-- fixing it myself, I guess...
defaultpreset.active[2][1] = {
  provider = "git_branch",
  hl = {
    fg = "white",
    bg = "oceanblue",
    style = "bold",
  },
  left_sep = {
    "slant_left_2",
    { str = " ", hl = { bg = "oceanblue", fg = "NONE" } },
  },
  right_sep = {
    { str = " ", hl = { bg = "oceanblue", fg = "NONE" } },
    "slant_right_2",
    " ",
  },
}

defaultpreset.active[2][2] = {
  provider = "git_diff_added",
  hl = {
    fg = "green",
    bg = "bg",
  },
  right_sep = {
    " ",
    {
      str = "vertical_bar_thin",
      hl = {
        fg = "fg",
        bg = "bg",
      },
    },
  },
}
defaultpreset.active[2][3] = {
  provider = "git_diff_changed",
  hl = {
    fg = "orange",
    bg = "bg",
  },
  right_sep = {
    " ",
    {
      str = "vertical_bar_thin",
      hl = {
        fg = "fg",
        bg = "bg",
      },
    },
  },
}
defaultpreset.active[2][4] = {
  provider = "git_diff_removed",
  hl = {
    fg = "red",
    bg = "bg",
  },

  right_sep = {
    " ",
    {
      str = "vertical_bar_thin",
      hl = {
        fg = "fg",
        bg = "bg",
      },
    },
  },
}

feline.setup()
