local M = {}

M.colors = nil

function M.setup(opts)
  -- TODO: this is not the default
  local palette = require("flow.palette")
  local default_palette = palette.get(opts)

  opts = opts or {}

  local colors = {
    transparent = default_palette.transparent,
    -- Some hi are still a mystery for me, use fluo green to discover them.
    to_check = default_palette.fluo.green.normal,
    -- Setting up default fluo
    fluo = default_palette.fluo.pink.normal,
    -- Store all variations of the fluo colors. They are used instead of the fluo
    -- normal in some cases to have a more pleasant result.
    Fluo = default_palette.fluo.pink,
    -- Standard colors
    black = default_palette.black,
    white = default_palette.white,
    grey = default_palette.grey,
  }

  if opts.fluo_color then
    colors.fluo = default_palette.fluo[opts.fluo_color].normal
    colors.Fluo = default_palette.fluo[opts.fluo_color]
  end

  -- Apply changes if the theme is not dark.
  if not opts.dark_theme then
    -- TODO: given how they are used, it is better to call them fg and bg?
    -- Invert black and white if the theme is not dark.
    colors.white = default_palette.black
    colors.black = default_palette.white

    -- Invert the table of grey
    local n_greys = #colors.grey
    for i = 1, math.floor(n_greys / 2) do
      local c = colors.grey[n_greys + 1 - i]
      colors.grey[n_greys + 1 - i] = colors.grey[i]
      colors.grey[i] = c
    end
  end

  -- If high contrast the darkest color is swap for the next color and the
  -- lightest color is swap for the color before.
  if opts.high_contrast then
    colors.grey[1], colors.grey[2] = colors.grey[2], colors.grey[1]
    colors.grey[6], colors.grey[7] = colors.grey[7], colors.grey[6]
  end

  colors.bg = (opts.transparent and default_palette.transparent) or default_palette.grey[2] -- used for theme background
  colors.fg = default_palette.grey[6] -- used for text in the colorscheme

  local function tbl_contains(tab, val)
    for _, value in ipairs(tab) do
      if value == val then
        return true
      end
    end

    return false
  end

  -- Handle mode-specific colors.
  local mode = opts.mode or "base"
  local modes = { "base", "dark", "bright", "desaturate" }
  if not tbl_contains(modes, mode) then
    vim.notify("Invalid mode: '" .. mode .. "'. Falling back to `base` mode.", vim.log.levels.WARN)
    mode = "base"
  end

  local color_names = {
    "orange",
    "yellow",
    "red",
    "purple",
    "blue",
    "light_blue",
    "sky_blue",
    "cyan",
    "green",
  }

  for _, key in ipairs(color_names) do
    -- Set the specific mode of the colors.
    colors[key] = default_palette[key][mode]
    -- Store all the color variations. These variables are used for hi that
    -- requires contrasts with the current theme, like git.
    local Key = key:gsub("^%l", string.upper)
    colors[Key] = default_palette[key]
  end

  -- Sidebar
  colors.fg_sidebar = default_palette.grey[5] -- use by items on quickfix list and help text
  colors.bg_sidebar = colors.bg

  -- Float
  colors.fg_float = colors.grey[5]
  colors.bg_float = default_palette.transparent

  -- Popups
  colors.fg_popup = default_palette.grey[6]
  colors.bg_popup = (opts.transparent and default_palette.transparent) or colors.grey[1]

  -- Statusline
  colors.fg_statusline = colors.grey[3]
  colors.bg_statusline = colors.grey[1]

  -- Highlights
  colors.fg_highlight = colors.fluo
  colors.bg_highlight = colors.grey[1] -- used for colorcolumn, cursorline, ...

  -- Gutter
  colors.fg_gutter = colors.grey[3] -- used for nontext, signcolumn, foldcolumn, ...
  colors.bg_gutter = colors.bg -- signcolumn, foldcolumn, ...

  -- Visual
  colors.bg_visual = colors.black
  colors.fg_visual = colors.fluo

  -- Borders
  colors.fg_border = default_palette.grey[4]
  colors.bg_border = default_palette.grey[3]

  -- Git
  colors.git = {
    add = colors.green,
    change = colors.yellow,
    delete = colors.red,
    ignore = colors.grey[4],
    untrcked = colors.sky_blue,
  }

  colors.diff = {
    add = colors.Green.very_dark, -- background of added lines
    delete = colors.Red.very_dark, -- background of deleted lines
    change = colors.Light_blue.very_dark, -- background of changed lines
    text = colors.Cyan.very_dark, -- background of changed characters
  }

  if not opts.dark_theme then
    colors.diff = {
      add = colors.Green.very_bright,
      delete = colors.Red.very_bright,
      change = colors.Light_blue.very_bright,
      text = colors.Cyan.very_bright,
    }
  end

  -- Diagnostics
  colors.error = colors.Red.base
  colors.todo = colors.Sky_blue.base
  colors.warning = colors.Yellow.base
  colors.info = colors.Cyan.base
  colors.hint = colors.Light_blue.base

  -- Misc
  colors.comment = default_palette.grey[4] -- slightly brighter than gutter

  colors.terminal_black = default_palette.black
  colors.terminal_white = default_palette.white

  M.colors = colors

  return colors
end

return M
