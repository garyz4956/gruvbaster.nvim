-- Gruvbaster - A Neovim colorscheme combining Gruvbox colors with Alabaster's minimalist philosophy
-- Only 4 syntax categories get colors: Strings, Constants, Comments, Definitions

local M = {}

--- Default configuration
M.config = {
  -- Contrast level: "hard", "soft", or "" (normal)
  contrast = "",

  -- Enable transparent background
  transparent_mode = false,

  -- Set terminal colors
  terminal_colors = true,

  -- Dim inactive windows
  dim_inactive = false,

  -- Override base palette colors
  -- Example: { bright_orange = "#e89a5a" } to make comments lighter
  palette_overrides = {},

  -- Override specific highlight groups
  -- Example: { StatusLine = { bg = "#504945" } }
  overrides = {},
}

--- Setup the colorscheme with user options
--- @param opts table|nil User configuration options
function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

--- Load the colorscheme
function M.load()
  -- Clear existing highlights
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  -- Reset syntax highlighting
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  -- Set colorscheme name
  vim.g.colors_name = "gruvbaster"

  -- Ensure termguicolors is enabled
  vim.o.termguicolors = true

  -- Load palette and highlights
  local palette = require("gruvbaster.palette")
  local highlights = require("gruvbaster.highlights")

  -- Get semantic colors based on background and config
  local p = palette.get_palette(M.config)

  -- Get all highlight groups
  local hl_groups = highlights.get_highlights(p, M.config)

  -- Apply user overrides
  hl_groups = vim.tbl_deep_extend("force", hl_groups, M.config.overrides)

  -- Set all highlight groups
  for group, settings in pairs(hl_groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end

  -- Set terminal colors if enabled
  if M.config.terminal_colors then
    M.set_terminal_colors(p)
  end
end

--- Set terminal colors
--- @param p table Semantic color palette
function M.set_terminal_colors(p)
  vim.g.terminal_color_0 = p.terminal.black
  vim.g.terminal_color_1 = p.terminal.red
  vim.g.terminal_color_2 = p.terminal.green
  vim.g.terminal_color_3 = p.terminal.yellow
  vim.g.terminal_color_4 = p.terminal.blue
  vim.g.terminal_color_5 = p.terminal.purple
  vim.g.terminal_color_6 = p.terminal.aqua
  vim.g.terminal_color_7 = p.terminal.white
  vim.g.terminal_color_8 = p.terminal.bright_black
  vim.g.terminal_color_9 = p.terminal.bright_red
  vim.g.terminal_color_10 = p.terminal.bright_green
  vim.g.terminal_color_11 = p.terminal.bright_yellow
  vim.g.terminal_color_12 = p.terminal.bright_blue
  vim.g.terminal_color_13 = p.terminal.bright_purple
  vim.g.terminal_color_14 = p.terminal.bright_aqua
  vim.g.terminal_color_15 = p.terminal.bright_white
end

--- Get the base color palette (for user reference)
--- @return table Base color palette
function M.get_palette()
  return require("gruvbaster.palette").colors
end

--- Get the current semantic palette (based on background)
--- @return table Semantic color palette
function M.get_current_palette()
  return require("gruvbaster.palette").get_palette(M.config)
end

return M
