# Gruvbaster.nvim

A Neovim colorscheme that combines [Gruvbox](https://github.com/morhetz/gruvbox)'s warm, retro color palette with [Alabaster](https://github.com/tonsky/vscode-theme-alabaster)'s minimalist syntax highlighting philosophy.

## Philosophy

Most syntax highlighting themes use too many colors, creating visual noise that hinders readability rather than helping it. Gruvbaster follows Alabaster's approach: **only 4 types of syntax elements receive colors**.

When everything is highlighted, nothing stands out. With only 4 colors, each becomes meaningful - you can visually "grep" for strings (green), constants (purple), definitions (aqua), or comments (orange).

### The 4 Highlighting Categories

| Category | Color | What Gets Highlighted |
|----------|-------|----------------------|
| **Strings** | Green (`#b8bb26`) | String literals, regex, template strings |
| **Constants** | Purple (`#d3869b`) | Numbers, booleans, nil/null, character literals |
| **Comments** | Orange (`#fe8019`) | All comments (prominently visible!) |
| **Definitions** | Aqua (`#8ec07c`) | Function/class/variable definitions |

### What Does NOT Get Highlighted

- Keywords (`if`, `else`, `return`, `function`, `for`, `while`, etc.)
- Types (`int`, `string`, `boolean`, `void`, etc.)
- Operators (`+`, `-`, `*`, `/`, `=`, `==`, etc.)
- Variable references (only definitions are colored)
- Function calls (only definitions are colored)

## Features

- Dark and light mode support
- Three contrast levels: hard, soft, and normal
- Transparent background option
- Full Treesitter support
- LSP semantic token support (following the 4-color rule)
- Extensive plugin support (Telescope, nvim-cmp, GitSigns, NvimTree, etc.)
- Fully customizable palette and highlight groups

## Requirements

- Neovim >= 0.8.0
- `termguicolors` enabled

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "garyz4956/gruvbaster.nvim",
  priority = 1000,
  config = function()
    require("gruvbaster").setup({})
    vim.cmd("colorscheme gruvbaster")
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "garyz4956/gruvbaster.nvim",
  config = function()
    require("gruvbaster").setup({})
    vim.cmd("colorscheme gruvbaster")
  end,
}
```

### Manual Installation

Clone the repository to your Neovim packages directory:

```bash
git clone https://github.com/yourusername/gruvbaster.nvim \
  ~/.local/share/nvim/site/pack/plugins/start/gruvbaster.nvim
```

## Configuration

Gruvbaster comes with sensible defaults, but you can customize it to your liking:

```lua
require("gruvbaster").setup({
  -- Contrast level: "hard", "soft", or "" (normal)
  contrast = "",

  -- Enable transparent background
  transparent_mode = false,

  -- Set terminal colors
  terminal_colors = true,

  -- Dim inactive windows
  dim_inactive = false,

  -- Override base palette colors
  palette_overrides = {},

  -- Override specific highlight groups
  overrides = {},
})

-- Load the colorscheme
vim.cmd("colorscheme gruvbaster")
```

### Switching Between Dark and Light Mode

Gruvbaster respects Neovim's `background` option:

```lua
-- Dark mode (default)
vim.o.background = "dark"
vim.cmd("colorscheme gruvbaster")

-- Light mode
vim.o.background = "light"
vim.cmd("colorscheme gruvbaster")
```

### Contrast Levels

```lua
-- Hard contrast (darker/lighter background)
require("gruvbaster").setup({ contrast = "hard" })

-- Soft contrast (softer background)
require("gruvbaster").setup({ contrast = "soft" })

-- Normal contrast (default)
require("gruvbaster").setup({ contrast = "" })
```

### Customizing Colors

You can override any color in the base palette. All highlight groups using that color will automatically update:

```lua
require("gruvbaster").setup({
  palette_overrides = {
    -- Make comments a lighter orange
    bright_orange = "#e89a5a",
    
    -- Use a different green for strings
    bright_green = "#a9b665",
    
    -- Custom background
    dark0 = "#1e1e1e",
  },
})
```

### Available Palette Colors

#### Dark Mode Syntax Colors

| Name | Default | Used For |
|------|---------|----------|
| `bright_green` | `#b8bb26` | Strings |
| `bright_purple` | `#d3869b` | Constants |
| `bright_orange` | `#fe8019` | Comments |
| `bright_aqua` | `#8ec07c` | Definitions |

#### Light Mode Syntax Colors

| Name | Default | Used For |
|------|---------|----------|
| `faded_green` | `#79740e` | Strings |
| `faded_purple` | `#8f3f71` | Constants |
| `faded_orange` | `#af3a03` | Comments |
| `faded_aqua` | `#427b58` | Definitions |

#### Background Colors (Dark Mode)

| Name | Default | Description |
|------|---------|-------------|
| `dark0_hard` | `#1d2021` | Hard contrast background |
| `dark0` | `#282828` | Normal background |
| `dark0_soft` | `#32302f` | Soft contrast background |
| `dark1` | `#3c3836` | Lighter background |
| `dark2` | `#504945` | UI elements |
| `dark3` | `#665c54` | UI elements |
| `dark4` | `#7c6f64` | UI elements |

#### Foreground Colors (Dark Mode)

| Name | Default | Description |
|------|---------|-------------|
| `light0` | `#fbf1c7` | Brightest foreground |
| `light1` | `#ebdbb2` | Normal foreground |
| `light2` | `#d5c4a1` | Dimmed foreground |
| `light3` | `#bdae93` | More dimmed |
| `light4` | `#a89984` | Most dimmed |

### Overriding Highlight Groups

For more granular control, you can override specific highlight groups:

```lua
require("gruvbaster").setup({
  overrides = {
    -- Custom StatusLine
    StatusLine = { fg = "#ebdbb2", bg = "#504945" },
    
    -- Make comments italic (if your font supports it)
    Comment = { fg = "#fe8019", italic = true },
    
    -- Custom cursor line
    CursorLine = { bg = "#3c3836" },
  },
})
```

## Supported Plugins

Gruvbaster includes highlight groups for many popular plugins:

- **Git**: GitSigns, gitcommit, diff
- **LSP**: Built-in LSP, diagnostics
- **Treesitter**: Full treesitter support
- **Completion**: nvim-cmp
- **File Explorers**: NvimTree, neo-tree
- **Fuzzy Finders**: Telescope
- **UI**: WhichKey, Notify, Dashboard, Lazy, Mason, Noice
- **Navigation**: Flash, Aerial, Navic
- **Debugging**: nvim-dap, nvim-dap-ui
- **Other**: Trouble, Indent Blankline, Mini.nvim

## API

### Get Base Palette

```lua
-- Get the base color palette (all available colors)
local palette = require("gruvbaster").get_palette()
print(palette.bright_green) -- #b8bb26
```

### Get Current Palette

```lua
-- Get the current semantic palette (based on background mode)
local colors = require("gruvbaster").get_current_palette()
print(colors.string)     -- Current string color
print(colors.comment)    -- Current comment color
print(colors.definition) -- Current definition color
print(colors.constant)   -- Current constant color
```

## Inspiration

- [Gruvbox](https://github.com/morhetz/gruvbox) - The warm, retro color palette
- [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) - Lua port of Gruvbox for Neovim
- [Alabaster](https://github.com/tonsky/vscode-theme-alabaster) - The minimalist highlighting philosophy

## License

MIT License - see [LICENSE](LICENSE) for details.
