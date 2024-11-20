local M = {}

M.colors = nil

function M.setup(opts)
  local palette = require("flow.palette")
  local default_palette = palette.get(opts)

  opts = opts or {}

  local colors = {}

  colors.transparent = default_palette.transparent

  -- Some hi are still a mystery for me, use fluo green to discover them.
  colors.to_check = default_palette.fluo.green.normal

  colors.fluo = (
    opts.fluo_color and default_palette.fluo[opts.fluo_color].normal
    or default_palette.fluo.pink.normal
  )

  -- Store all variations of the fluo colors. They are used instead of the fluo
  -- normal in some cases to have a more pleasant result.
  colors.Fluo = (
    opts.fluo_color and default_palette.fluo[opts.fluo_color] or default_palette.fluo.pink
  )

  colors.black = default_palette.black
  colors.white = default_palette.white
  colors.grey = default_palette.grey

  -- Apply changes if the theme is not dark.
  if not opts.dark_theme then
    -- Invert black and white if the theme is not dark.
    colors.white = default_palette.black
    colors.black = default_palette.white

    -- Swap greys on the median value in the array
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
    local grey_1 = colors.grey[1]
    colors.grey[1] = colors.grey[2]
    colors.grey[2] = grey_1

    local grey_6 = colors.grey[6]
    colors.grey[6] = colors.grey[7]
    colors.grey[7] = grey_6
  end

  colors.bg = (opts.transparent and default_palette.transparent) or default_palette.grey[2] -- used for theme background

  colors.fg = default_palette.grey[6] -- used for text in the colorscheme
  colors.fg_dark = colors.grey[4]

  -- Main colors
  colors.orange = default_palette.orange.base
  colors.yellow = default_palette.yellow.base
  colors.red = default_palette.red.base
  colors.purple = default_palette.purple.base
  colors.blue = default_palette.blue.base
  colors.light_blue = default_palette.light_blue.base
  colors.sky_blue = default_palette.sky_blue.base
  colors.cyan = default_palette.cyan.base
  colors.green = default_palette.green.base

  if opts.mode == "base" then
    -- Skip since base is the default.
  elseif opts.mode == "dark" then
    colors.orange = default_palette.orange.dark
    colors.yellow = default_palette.yellow.dark
    colors.red = default_palette.red.dark
    colors.purple = default_palette.purple.dark
    colors.blue = default_palette.blue.dark
    colors.light_blue = default_palette.light_blue.dark
    colors.sky_blue = default_palette.sky_blue.dark
    colors.cyan = default_palette.cyan.dark
    colors.green = default_palette.green.dark
  elseif opts.mode == "bright" then
    colors.orange = default_palette.orange.bright
    colors.yellow = default_palette.yellow.bright
    colors.red = default_palette.red.bright
    colors.purple = default_palette.purple.bright
    colors.blue = default_palette.blue.bright
    colors.light_blue = default_palette.light_blue.bright
    colors.sky_blue = default_palette.sky_blue.bright
    colors.cyan = default_palette.cyan.bright
    colors.green = default_palette.green.bright
  elseif opts.mode == "desaturate" then
    colors.orange = default_palette.orange.desaturate
    colors.yellow = default_palette.yellow.desaturate
    colors.red = default_palette.red.desaturate
    colors.purple = default_palette.purple.desaturate
    colors.blue = default_palette.blue.desaturate
    colors.light_blue = default_palette.light_blue.desaturate
    colors.sky_blue = default_palette.sky_blue.desaturate
    colors.cyan = default_palette.cyan.desaturate
    colors.green = default_palette.green.desaturate
  else
    vim.notify(
      "Invalid mode: '" .. opts.mode .. "'. Falling back to 'base' mode.",
      vim.log.levels.WARN
    )
  end

  -- Store all the color variations
  colors.Orange = default_palette.orange
  colors.Yellow = default_palette.yellow
  colors.Red = default_palette.red
  colors.Purple = default_palette.purple
  colors.Blue = default_palette.blue
  colors.Light_blue = default_palette.light_blue
  colors.Sky_blue = default_palette.sky_blue
  colors.Cyan = default_palette.cyan
  colors.Green = default_palette.green

  -- Sidebar
  colors.fg_sidebar = default_palette.grey[5] -- use by items on quickfix list and help text
  colors.bg_sidebar = colors.bg

  -- Float
  colors.fg_float = colors.grey[5]
  colors.bg_float = opts.transparent and default_palette.transparent or colors.grey[6]

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

  M.colors = colors

  return colors
end

return M
