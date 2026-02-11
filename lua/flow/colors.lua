local hsl = require("flow.util").hsl_to_hex

local M = {}

M.colors = nil

M._color_names =
  { "orange", "yellow", "red", "purple", "blue", "light_blue", "sky_blue", "cyan", "green" }

-- Setup the colorscheme colors based on the options and palette.
--- @param opts FlowConfig: The options to setup the colorscheme.
--- @return table: The colors used by the colorscheme.
function M.setup(opts)
  local default_palette = require("flow.palette").get(opts or {})

  opts = opts or {}

  -- Get the configured fluo color (with fallback to default)
  local fluo_color = (opts.colors and opts.colors.fluo) or "pink"

  local colors = {
    -- Core colors
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

  M._apply_opts(default_palette, colors, opts)

  for _, key in ipairs(M._color_names) do
    -- Set the specific mode of the colors.
    colors[key] = default_palette[key][opts.colors.mode]
    -- Store all the color variations. These variables are used for hi that
    -- requires contrasts with the current theme, like git.
    local Key = key:gsub("^%l", string.upper)
    colors[Key] = default_palette[key]
  end

  colors.comment = default_palette.grey[7]

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

  local is_transparent = opts.theme.transparent == true

  -- Gutter: used for line numbers, signs, and fold column.
  colors.fg_gutter = colors.grey[5]
  colors.bg_gutter = (is_transparent and default_palette.transparent) or colors.bg

  -- Float: used for visual elements that are floating and triggered by the user.
  colors.fg_float = colors.grey[8]
  colors.bg_float = hsl(203, 20, 18)

  -- Popups: use for completion menu and all visual components that appears autonomously.
  colors.fg_popup = default_palette.grey[9]
  colors.bg_popup = (is_transparent and default_palette.transparent) or colors.bg

  -- Statusline and tabline
  colors.fg_statusline = colors.grey[6]
  colors.bg_statusline = colors.grey[1]

  -- Highlights
  colors.fg_highlight = colors.grey[6]
  colors.bg_highlight = colors.grey[2]

  -- Visual - uses configured fluo color
  colors.bg_visual = opts.theme.style == "dark"
    and default_palette.visual_bg.dark
    or default_palette.visual_bg.light
  colors.fg_visual = colors.grey[2]

  -- Git
  colors.git = {
    add = colors.green, -- Added files/lines
    change = colors.light_blue, -- Modified files/lines
    delete = colors.red, -- Deleted files/lines
    ignore = colors.grey[7], -- Ignored files
    untracked = colors.sky_blue, -- New untracked files
  }

  local is_dark = opts.theme.style == "dark"
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

--- @param opts FlowConfig
function M._apply_opts(default_palette, colors, opts)
  if opts.colors.fluo then
    colors.fluo = default_palette.fluo[opts.colors.fluo].default
    colors.Fluo = default_palette.fluo[opts.colors.fluo]
  end

  -- Apply changes if the theme is not dark.
  -- HACK: this has to be executed before all changes that involves white, black, and grey.
  if opts.theme.style ~= "dark" then
    M._invert_colors_for_theme(colors)
  end

  -- If high contrast the darkest color is swap for the next color and the
  -- lightest color is swap for the color before.
  if opts.theme.contrast == "high" then
    M._invert_colors_for_contrast(colors)
  end

  colors.bg = (opts.theme.transparent and default_palette.transparent) or default_palette.grey[3] -- used for theme background
  colors.fg = (opts.theme.style == "dark" and colors.grey[8]) or colors.grey[8]

  -- Borders
  if opts.ui.borders == "none" then
    colors.fg_border = colors.bg -- Match background to make borders invisible
  elseif opts.ui.borders == "light" then
    colors.fg_border = colors.grey[4]
  else -- dark (default)
    colors.fg_border = colors.grey[1]
  end

  -- Vertical separator - always visible, slightly darker than background
  colors.fg_vsplit = colors.grey[4]

  -- CursorLine background - uses configured fluo color
  colors.bg_cursorline = opts.theme.style == "dark"
    and default_palette.cursorline_bg.dark
    or default_palette.cursorline_bg.light

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
