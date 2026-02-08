# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Flow is a Neovim colorscheme plugin written in Lua. It features an HSL-based color palette with nine primary colors (light blue, blue, cyan, purple, green, yellow, orange, red, sky blue) plus fluorescent accent colors. The plugin supports both dark and light themes with customizable contrast levels and transparency.

## Build Commands

**Format code:**
```bash
make fmt
```
Uses stylua with `.stylua.toml` config to format all Lua files in `lua/`.

**Generate extra themes:**
```bash
make extras
```
Generates theme files for external tools (Alacritty, Kitty, Tmux, fzf, Ghostty) based on the Nvim colorscheme. Uses `scripts/generate-extras.lua`. Generated files are output to `./extra/` directory.

**Run all tasks:**
```bash
make all
```
Runs both `fmt` and `extras`.

## Architecture

### Color System (HSL-Based)

The colorscheme uses a three-layer color system:

1. **Palette Layer** (`lua/flow/palette.lua`):
   - Generates base HSL colors with configurable shades (very_dark, dark, default, light, very_light)
   - Each of 9 colors defined by hue value (e.g., blue=230°, cyan=165°, green=115°)
   - Supports custom saturation and lightness overrides via config
   - Fluorescent colors with 100% saturation for accents

2. **Colors Layer** (`lua/flow/colors.lua`):
   - Transforms palette into semantic colors (fg, bg, error, warning, etc.)
   - Handles theme inversion for light/dark modes
   - Applies contrast adjustments by swapping grey shades
   - Manages UI-specific colors (gutter, float, popup, statusline, borders)
   - Provides full color variations (e.g., `colors.blue` and `colors.Blue` with all shades)

3. **Highlights Layer** (`lua/flow/highlights/*.lua`):
   - Maps semantic colors to Neovim highlight groups
   - Each file handles a specific category (base, syntax, git, lsp, etc.)
   - All highlight modules export a `get(colors, options)` function returning highlight definitions

### Plugin Flow

1. User calls `require("flow").setup(opts)` → validates and stores config in `lua/flow/config.lua`
2. User calls `vim.cmd("colorscheme flow")` → triggers `lua/flow/init.lua:load()`
3. `load()` calls `lua/flow/theme.lua:configure()` which:
   - Sets up colors via `colors.setup(options)`
   - Iterates through `theme.active_highlights` list
   - Requires each highlight module and calls its `get()` function
   - Merges all highlight tables
4. Final highlights applied via `vim.api.nvim_set_hl()`

### Configuration System

- Defaults in `lua/flow/config.lua` with full type annotations (`@class`, `@alias`)
- Options validated before merge to catch invalid values early
- Three main config sections:
  - `theme`: style (dark/light), contrast (default/high), transparent
  - `colors`: mode (default/dark/light), fluo accent color, custom saturation/lightness
  - `ui`: borders style, aggressive_spell, aggressive_special_comment

### Extra Themes Generator

Located in `lua/flow/extra/`:
- `init.lua` - Public API
- `main.lua` - Generation logic
- `config.lua` - Theme variant definitions
- `template/*.lua` - Template files with `${variable}` placeholders
- Uses `util.interpolate()` to replace placeholders with color values

## Code Organization

**Core modules:**
- `lua/flow/init.lua` - Entry point with `setup()` and `load()` functions
- `lua/flow/config.lua` - Configuration defaults and validation
- `lua/flow/theme.lua` - Orchestrates highlight generation
- `lua/flow/palette.lua` - HSL color generation
- `lua/flow/colors.lua` - Semantic color mapping
- `lua/flow/util.lua` - HSL/RGB conversion and interpolation utilities

**Highlight modules:** (`lua/flow/highlights/*.lua`)
Each module exports `M.get(colors, options)` returning a table of `{ [group] = {...} }` definitions.

**Entry point for colorscheme:**
`colors/flow.lua` - Loads the plugin when `:colorscheme flow` is executed

**Integrations:**
- `lua/lualine/themes/flow.lua` - Lualine statusline theme
- `lua/barbecue/theme/flow.lua` - Barbecue winbar theme

## Key Implementation Patterns

### Highlight Group Hierarchy

Flow uses a **three-tier highlight system** for maintainability and consistency:

1. **Base Groups** (defined in `base.lua` and `syntax.lua`):
   - **Git operations**: `Added`, `Removed`, `Changed` - Git add/delete/modify states
   - **Special comments**: `Todo`, `Fixme`, `Note`, `Hack`, `Warn` - Comment annotations
   - **Headers**: `FlowHeader` - Main headers for plugin UIs (Lazy, Mason)
   - **Titles**: `FloatTitle` - Titles for floating windows, `FlowPluginTitle` - Titles for plugin UIs (Telescope, Avante)
   - **Buttons**: `FlowButton`, `FlowButtonActive` - Interactive button elements
   - **Blocks**: `FlowHighlightBlock` - Highlighted/selected blocks
   - **States**: `FlowSuccess`, `FlowError`, `FlowWarning`, `FlowInfo` - Semantic state indicators
   - **Borders**: `Border` - Transparent borders for plugin UIs, `FloatBorder` - Borders for floating windows with background
   - **LSP Kinds** (code elements): 26 `FlowKind*` groups with distinct, vibrant colors for maximum visual distinction in completion menus. Each kind (Function, Method, Variable, Property, Field, Constant, Class, Interface, Module, Operator, etc.) has a carefully chosen color from Flow's palette. See `LSP_KIND_COLORS.md` for complete mapping. Used by completion plugins (nvim-cmp, blink) and DAP UI.

2. **Plugin Groups** (defined in `highlights/*.lua`):
   - Link to base groups whenever semantically appropriate
   - Use direct colors only for plugin-specific styling

3. **Treesitter/LSP Groups** (defined in `treesitter.lua`, `lsp.lua`):
   - Link to syntax base groups for consistency

### Adding Support for a New Plugin

1. Create `lua/flow/highlights/plugin-name.lua`
2. Implement `M.get(colors, options)` function
3. **First, check if base groups can be reused:**
   - Headers → link to `FlowHeader`
   - Titles → link to `FlowPluginTitle` (transparent) or `FloatTitle` (floating)
   - Buttons → link to `FlowButton`/`FlowButtonActive`
   - Success states → link to `FlowSuccess`
   - Error states → link to `FlowError`
   - Warning/Info states → link to `FlowWarning`/`FlowInfo`
   - Git operations → link to `Added`/`Removed`/`Changed`
   - Borders → link to `Border` (transparent) or `FloatBorder` (with background)
   - Code elements (functions, variables, types, etc.) → link to `FlowKind*` groups
4. Only define custom colors for truly plugin-specific elements
5. Add "plugin-name" to `theme.active_highlights` in `lua/flow/theme.lua`

**When to create new base groups:**
- When 3+ plugins would benefit from the same semantic meaning
- When the concept is universally applicable (not plugin-specific)
- Add them to `base.lua` with clear comments about their purpose

**Color naming convention:**
- Lowercase (e.g., `colors.blue`) = single shade based on mode setting
- Capitalized (e.g., `colors.Blue`) = table with all shades (very_dark, dark, default, light, very_light)
- Special semantic colors: `fg`, `bg`, `error`, `warning`, `info`, `hint`, `fluo`

**Theme/Contrast adjustments:**
- Light theme: inverts black/white and reverses grey scale order
- High contrast: swaps darkest/lightest grey shades for more pronounced separations

## Diagnostic Warnings

The "Undefined global `vim`" warnings are expected in a Neovim plugin context. The `vim` global is provided by Neovim's Lua runtime and these can be ignored or suppressed with a `.luarc.json` configuration.
