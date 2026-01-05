-- Gruvbaster color palette
-- Combines Gruvbox colors with Alabaster's minimalist philosophy

local M = {}

-- Base Gruvbox color palette (all colors that can be overridden)
M.colors = {
  -- Dark background colors
  dark0_hard = "#1d2021",
  dark0 = "#282828",
  dark0_soft = "#32302f",
  dark1 = "#3c3836",
  dark2 = "#504945",
  dark3 = "#665c54",
  dark4 = "#7c6f64",

  -- Light background colors
  light0_hard = "#f9f5d7",
  light0 = "#fbf1c7",
  light0_soft = "#f2e5bc",
  light1 = "#ebdbb2",
  light2 = "#d5c4a1",
  light3 = "#bdae93",
  light4 = "#a89984",

  -- Bright colors (used in dark mode)
  bright_red = "#fb4934",
  bright_green = "#b8bb26",
  bright_yellow = "#fabd2f",
  bright_blue = "#83a598",
  bright_purple = "#d3869b",
  bright_aqua = "#8ec07c",
  bright_orange = "#fe8019",

  -- Faded colors (used in light mode)
  faded_red = "#9d0006",
  faded_green = "#79740e",
  faded_yellow = "#b57614",
  faded_blue = "#076678",
  faded_purple = "#8f3f71",
  faded_aqua = "#427b58",
  faded_orange = "#af3a03",

  -- Neutral colors (used for terminal)
  neutral_red = "#cc241d",
  neutral_green = "#98971a",
  neutral_yellow = "#d79921",
  neutral_blue = "#458588",
  neutral_purple = "#b16286",
  neutral_aqua = "#689d6a",
  neutral_orange = "#d65d0e",

  -- Gray
  gray = "#928374",

  -- Diff colors (dark)
  dark_red_hard = "#792329",
  dark_red = "#722529",
  dark_red_soft = "#7b2c2f",
  dark_green_hard = "#5a633a",
  dark_green = "#62693e",
  dark_green_soft = "#686d43",
  dark_aqua_hard = "#3e4934",
  dark_aqua = "#49503b",
  dark_aqua_soft = "#525742",

  -- Diff colors (light)
  light_red_hard = "#fc9690",
  light_red = "#fc9487",
  light_red_soft = "#f78b7f",
  light_green_hard = "#d3d6a5",
  light_green = "#d5d39b",
  light_green_soft = "#cecb94",
  light_aqua_hard = "#e6e9c1",
  light_aqua = "#e8e5b5",
  light_aqua_soft = "#e1dbac",
}

--- Generate semantic palette based on background and config
--- @param config table Configuration options
--- @return table Semantic color palette
function M.get_palette(config)
  -- Merge user overrides with base colors
  local colors = vim.tbl_deep_extend("force", M.colors, config.palette_overrides or {})

  local p = {}

  if vim.o.background == "dark" then
    -- Background colors (based on contrast setting)
    if config.contrast == "hard" then
      p.bg0 = colors.dark0_hard
      p.diff_red = colors.dark_red_hard
      p.diff_green = colors.dark_green_hard
      p.diff_aqua = colors.dark_aqua_hard
    elseif config.contrast == "soft" then
      p.bg0 = colors.dark0_soft
      p.diff_red = colors.dark_red_soft
      p.diff_green = colors.dark_green_soft
      p.diff_aqua = colors.dark_aqua_soft
    else
      p.bg0 = colors.dark0
      p.diff_red = colors.dark_red
      p.diff_green = colors.dark_green
      p.diff_aqua = colors.dark_aqua
    end

    p.bg1 = colors.dark1
    p.bg2 = colors.dark2
    p.bg3 = colors.dark3
    p.bg4 = colors.dark4

    -- Foreground colors
    p.fg0 = colors.light0
    p.fg1 = colors.light1
    p.fg2 = colors.light2
    p.fg3 = colors.light3
    p.fg4 = colors.light4

    -- Semantic colors (Alabaster's 4 categories) - using bright variants
    p.string = colors.bright_green
    p.constant = colors.bright_purple
    p.comment = colors.bright_orange
    p.definition = colors.bright_aqua

    -- Auxiliary colors
    p.punctuation = colors.gray
    p.error = colors.bright_red
    p.warning = colors.bright_yellow
    p.info = colors.bright_blue
    p.hint = colors.bright_aqua
    p.ok = colors.bright_green

    -- Terminal colors
    p.terminal = {
      black = colors.dark0,
      red = colors.neutral_red,
      green = colors.neutral_green,
      yellow = colors.neutral_yellow,
      blue = colors.neutral_blue,
      purple = colors.neutral_purple,
      aqua = colors.neutral_aqua,
      white = colors.light4,
      bright_black = colors.gray,
      bright_red = colors.bright_red,
      bright_green = colors.bright_green,
      bright_yellow = colors.bright_yellow,
      bright_blue = colors.bright_blue,
      bright_purple = colors.bright_purple,
      bright_aqua = colors.bright_aqua,
      bright_white = colors.light1,
    }
  else
    -- Light mode
    -- Background colors (based on contrast setting)
    if config.contrast == "hard" then
      p.bg0 = colors.light0_hard
      p.diff_red = colors.light_red_hard
      p.diff_green = colors.light_green_hard
      p.diff_aqua = colors.light_aqua_hard
    elseif config.contrast == "soft" then
      p.bg0 = colors.light0_soft
      p.diff_red = colors.light_red_soft
      p.diff_green = colors.light_green_soft
      p.diff_aqua = colors.light_aqua_soft
    else
      p.bg0 = colors.light0
      p.diff_red = colors.light_red
      p.diff_green = colors.light_green
      p.diff_aqua = colors.light_aqua
    end

    p.bg1 = colors.light1
    p.bg2 = colors.light2
    p.bg3 = colors.light3
    p.bg4 = colors.light4

    -- Foreground colors (inverted for light mode)
    p.fg0 = colors.dark0
    p.fg1 = colors.dark1
    p.fg2 = colors.dark2
    p.fg3 = colors.dark3
    p.fg4 = colors.dark4

    -- Semantic colors (Alabaster's 4 categories) - using faded variants
    p.string = colors.faded_green
    p.constant = colors.faded_purple
    p.comment = colors.faded_orange
    p.definition = colors.faded_aqua

    -- Auxiliary colors
    p.punctuation = colors.gray
    p.error = colors.faded_red
    p.warning = colors.faded_yellow
    p.info = colors.faded_blue
    p.hint = colors.faded_aqua
    p.ok = colors.faded_green

    -- Terminal colors
    p.terminal = {
      black = colors.light0,
      red = colors.faded_red,
      green = colors.faded_green,
      yellow = colors.faded_yellow,
      blue = colors.faded_blue,
      purple = colors.faded_purple,
      aqua = colors.faded_aqua,
      white = colors.dark4,
      bright_black = colors.gray,
      bright_red = colors.neutral_red,
      bright_green = colors.neutral_green,
      bright_yellow = colors.neutral_yellow,
      bright_blue = colors.neutral_blue,
      bright_purple = colors.neutral_purple,
      bright_aqua = colors.neutral_aqua,
      bright_white = colors.dark1,
    }
  end

  return p
end

return M
