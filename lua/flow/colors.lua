local palette = require("flow.palette")

local M = {
  --- Names of the colors used in the colorscheme.
  names = {
    "blue",
    "cyan",
    "green",
    "light_blue",
    "orange",
    "purple",
    "red",
    "sky_blue",
    "yellow",
  },

  colors = nil,
}

--- Setup the colorscheme colors based on the options and palette.
--- @param config FlowConfig The configuration options to setup the colorscheme.
--- @return table The colors used by the colorscheme.
function M.setup(config)
  config = config or {}

  local default_palette = palette.get(config)

  -- Get the configured fluo color (with fallback to default)
  local fluo_color = (config.colors and config.colors.fluo) or "pink"

  local colors = {
    -- Core colors.
    transparent = default_palette.transparent,
    black = default_palette.black,
    white = default_palette.white,
    grey = default_palette.grey,

    -- Fluo colors
    fluo = default_palette.fluo[fluo_color].default,
    -- Full palette of the fluo colors.
    Fluo = default_palette.fluo[fluo_color],

    -- Debug: some hi are still a mystery to me, use fluo green to discover them.
    to_check = default_palette.fluo.green.default,
  }

  M._apply_opts(default_palette, colors, config)

  for _, key in ipairs(M.names) do
    -- Set the specific mode of the colors.
    colors[key] = default_palette[key][config.colors.mode]
    -- Store all the color variations. These variables are used for hi that
    -- require contrasts with the current theme, like git.
    local Key = key:gsub("^%l", string.upper)
    colors[Key] = default_palette[key]
  end

  -- Yellow is perceptually too light for light backgrounds, use the dark shade instead.
  if config.theme.style ~= "dark" then
    colors.yellow = colors.Yellow.dark
  end

  -- Comments - use lighter grey for light theme
  colors.comment = config.theme.style == "dark" and colors.grey[7] -- Dark theme: 50% lightness
    or colors.grey[6] -- Light theme: darker grey for readability against light background

  -- +----------------------------------------------------------------------------------------+
  -- | Sidebar (e.g., NERDTree, Telescope, Quickfix)                                          | <- Sidebar
  -- |                                                                                        |
  -- | Folder1/                                                                               |
  -- | ├─ file1.txt                                                                           |
  -- | ├─ file2.txt                                                                           |
  -- |                                                                                        |
  -- +----------------------------------------------------------------------------------------+
  -- | Gutter | Main Buffer Area                           ▐ <- Highlight                     |
  -- |        |                                            ▐                                  |
  -- |  1     | fn main() {                                ▐                                  |
  -- |  + Git |     println!("Flow!");                     ▐                                  | <- Main Buffer
  -- |  3     | }                                          ▐                                  |
  -- |        |                                            ▐                                  |
  -- |  5     |                                            ▐                                  |
  -- |        |                                            ▐                                  |
  -- +--------------------------------------------------------------------------------------- +
  -- | Statusline: [Mode] [Filename] [Cursor Position]                                        | <- Statusline
  -- +--------------------------------------------------------------------------------------- +
  -- | Command Line/Prompt Area                                                               | <- Command Line
  -- +--------------------------------------------------------------------------------------- +

  -- Sidebar: used by the quickfix list, help, and explorer windows.
  -- NOTE: not used.
  colors.fg_sidebar = default_palette.grey[8]
  colors.bg_sidebar = colors.bg

  local is_transparent = config.theme.transparent == true

  -- Gutter: used for line numbers, signs, and fold column.
  colors.fg_gutter = colors.grey[5]
  colors.bg_gutter = (is_transparent and default_palette.transparent) or colors.bg
  --
  -- -- CursorLine background.
  --
  -- -- Visual selection background.
  -- visual_bg = {
  --   dark = hsl_to_hex(fluo_hue_value, 90, 23), -- For dark theme
  --   light = hsl_to_hex(fluo_hue_value, 90, 77), -- For light theme
  -- },
  --

  -- -- Float window colors.
  -- float_bg = {
  --   dark = hsl_to_hex(203, 20, 18), -- For dark theme
  --   light = hsl_to_hex(203, 20, 82), -- For light theme
  -- },
  -- Float: used for visual elements that are floating and triggered by the user.
  colors.fg_float = colors.grey[8]
  colors.bg_float = default_palette.grey[2]

  -- Popups: use for completion menu and all visual components that appears autonomously.
  colors.fg_popup = default_palette.grey[9]
  colors.bg_popup = (is_transparent and default_palette.transparent) or colors.bg_float

  -- Statusline and tabline
  colors.fg_statusline = colors.grey[6]
  colors.bg_statusline = colors.grey[1]

  -- Highlights
  colors.fg_highlight = colors.grey[6]
  colors.bg_highlight = colors.grey[2]

  -- visual_bg = {
  --   dark = hsl_to_hex(fluo_hue_value, 90, 23), -- For dark theme
  --   light = hsl_to_hex(fluo_hue_value, 90, 77), -- For light theme
  -- },
  -- Visual - uses configured fluo color
  colors.bg_visual = config.theme.style == "dark" and colors.Fluo.dark or colors.Fluo.light
  colors.fg_visual = colors.grey[2]

  -- Git
  colors.git = {
    add = colors.green, -- Added files/lines
    change = colors.light_blue, -- Modified files/lines
    delete = colors.red, -- Deleted files/lines
    ignore = colors.grey[7], -- Ignored files
    untracked = colors.sky_blue, -- New untracked files
  }

  local is_dark = config.theme.style == "dark"
  colors.diff = {
    add = not is_dark and colors.Green.very_light or colors.Green.very_dark,
    delete = not is_dark and colors.Red.very_light or colors.Red.very_dark,
    change = not is_dark and colors.Light_blue.very_light or colors.Sky_blue.very_dark,
    text = not is_dark and colors.Green.very_light or colors.Green.very_dark,
    parent = not is_dark and colors.Cyan.very_light or colors.Cyan.very_dark,
  }

  -- LSP diagnostics
  colors.error = colors.Red.default -- Error messages
  colors.warning = colors.Yellow.default -- Warning messages
  colors.info = colors.Cyan.default -- Information messages
  colors.hint = colors.Light_blue.default -- Hints and suggestions

  -- Special Comments
  colors.todo = is_dark and colors.Sky_blue.default or colors.Sky_blue.dark -- TODO comments
  colors.note = is_dark and colors.Green.default or colors.Green.dark -- NOTE comments
  colors.fixme = is_dark and colors.Red.default or colors.Red.dark -- FIXME comments
  colors.hack = is_dark and colors.Yellow.default or colors.Yellow.dark -- HACK comments

  -- Apply monochrome transformation if enabled
  if config.variant == "mono" then
    require("flow.mono").apply(colors, config)
  end

  M.colors = colors

  return colors
end

function M._tbl_contains(tab, val)
  for _, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end

--- @param t table: The table to swap elements.
--- @param a number: The index of the first element to swap.
--- @param b number: The index of the second element to swap.
function M._swap(t, a, b)
  t[a], t[b] = t[b], t[a]
end

--- @param default_palette table
--- @param colors table
--- @param config FlowConfig
function M._apply_opts(default_palette, colors, config)
  if config.colors.fluo then
    colors.fluo = default_palette.fluo[config.colors.fluo].default
    colors.Fluo = default_palette.fluo[config.colors.fluo]
  end

  -- Apply changes if the theme is not dark.
  -- HACK: this has to be executed before all changes that involves white, black, and grey.
  if config.theme.style ~= "dark" then
    M._invert_colors_for_theme(colors)
  end

  -- If high contrast the darkest color is swap for the next color and the
  -- lightest color is swap for the color before.
  if config.theme.contrast == "high" then
    M._invert_colors_for_contrast(colors)
  end

  colors.bg = (config.theme.transparent and default_palette.transparent) or default_palette.grey[3] -- used for theme background
  colors.fg = (config.theme.style == "dark" and colors.grey[8]) or colors.grey[8]

  -- Borders
  if config.ui.borders == "none" then
    colors.fg_border = colors.bg -- Match background to make borders invisible
    colors.fg_vsplit = colors.grey[2]
  elseif config.ui.borders == "light" then
    colors.fg_border = colors.grey[4]
    colors.fg_vsplit = colors.grey[4]
  else -- dark (default)
    colors.fg_border = colors.grey[1]
    colors.fg_vsplit = colors.grey[1]
  end

  -- cursorline_bg = {
  --   dark = hsl_to_hex(fluo_hue_value, 20, 13), -- For dark theme
  --   light = hsl_to_hex(fluo_hue_value, 20, 87), -- For light theme
  -- },
  -- CursorLine background - uses configured fluo color
  colors.bg_cursorline = config.theme.style == "dark" and colors.Fluo.very_dark
    or colors.Fluo.very_light

  -- NOTE bg_border is currently not used.
  colors.bg_border = colors.grey[7]
end

function M._invert_colors_for_theme(colors)
  -- TODO: given how they are used, it is better to call them fg and bg?
  -- Invert black and white if the theme is not dark.
  colors.white, colors.black = colors.black, colors.white
  local n_greys = #colors.grey

  for i = 1, math.floor(n_greys / 2) do
    M._swap(colors.grey, i, n_greys + 1 - i)
  end
end

function M._invert_colors_for_contrast(colors)
  colors.grey[1], colors.grey[3] = colors.grey[3], colors.grey[1]
  colors.grey[9], colors.grey[10] = colors.grey[10], colors.grey[9]
end

return M
