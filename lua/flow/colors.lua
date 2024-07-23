local M = {}

M.colors = nil

function M.setup(opts)
  local palette = require("flow.palette")
  local default_palette = palette.get()

  opts = opts or {}

  local colors = {}

  colors.transparent = default_palette.transparent
  colors.to_check = default_palette.fluo.green -- value used for hi that i don't know how they are applied.

  colors.fluo = (
    opts.fluo_color and default_palette.fluo[opts.fluo_color] or default_palette.fluo.pink
  ) -- used for cursor line nr, ..

  colors.black = default_palette.black
  colors.white = default_palette.white
  colors.grey = default_palette.grey

  -- Background colors
  colors.bg = (opts.transparent and default_palette.transparent) or default_palette.grey[2] -- used for theme background
  colors.bg_dark = default_palette.grey[6]

  -- Foreground colors
  colors.fg = default_palette.grey[6] -- used for text in the colorscheme
  colors.fg_dark = colors.grey4

  -- Main colors
  if opts.mode == "dark" then
    colors.orange = default_palette.orange.dim
    colors.yellow = default_palette.yellow.dim -- match parens, ...
    colors.red = default_palette.red.dim
    colors.purple = default_palette.purple.dim
    colors.blue = default_palette.blue.dim
    colors.light_blue = default_palette.light_blue.dim
    colors.teal = default_palette.teal.dim
    colors.cyan = default_palette.cyan.dim
    colors.green = default_palette.green.dim
  elseif opts.mode == "bright" then
    colors.orange = default_palette.orange.bright
    colors.yellow = default_palette.yellow.bright -- match parens, ...
    colors.red = default_palette.red.bright
    colors.purple = default_palette.purple.bright
    colors.blue = default_palette.blue.bright
    colors.light_blue = default_palette.light_blue.bright
    colors.teal = default_palette.teal.bright
    colors.cyan = default_palette.cyan.bright
    colors.green = default_palette.green.bright
  elseif opts.mode == "desaturate" then
    colors.orange = default_palette.orange.desat
    colors.yellow = default_palette.yellow.desat -- match parens, ...
    colors.red = default_palette.red.desat
    colors.purple = default_palette.purple.desat
    colors.blue = default_palette.blue.desat
    colors.light_blue = default_palette.light_blue.desat
    colors.teal = default_palette.teal.desat
    colors.cyan = default_palette.cyan.desat
    colors.green = default_palette.green.desat
  else
    colors.orange = default_palette.orange.base
    colors.yellow = default_palette.yellow.base -- match parens, ...
    colors.red = default_palette.red.base
    colors.purple = default_palette.purple.base
    colors.blue = default_palette.blue.base
    colors.light_blue = default_palette.light_blue.base
    colors.teal = default_palette.teal.base
    colors.cyan = default_palette.cyan.base
    colors.green = default_palette.green.base
  end

  colors.Orange = default_palette.orange
  colors.Yellow = default_palette.yellow
  colors.Red = default_palette.red
  colors.Purple = default_palette.purple
  colors.Blue = default_palette.blue
  colors.Light_blue = default_palette.light_blue
  colors.Teal = default_palette.teal
  colors.Cyan = default_palette.cyan
  colors.Green = default_palette.green

  -- Sidebar
  colors.fg_sidebar = default_palette.grey[5] -- use by items on quickfix list and help text
  colors.bg_sidebar = (opts.transparent and default_palette.transparent) or colors.bg

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
  colors.fg_highlight = default_palette.fluo.orange
  colors.bg_highlight = colors.grey[1] -- used for colorcolumn, cursorline, ...

  -- Gutter
  colors.fg_gutter = colors.grey[3] -- used for nontext, signcolumn, foldcolumn, ...
  colors.bg_gutter = colors.bg -- signcolumn, foldcolumn, ...

  -- Visual
  colors.bg_visual = colors.black
  colors.fg_visual = colors.fluo

  -- Borders
  colors.border_highlight = default_palette.fluo.orange
  colors.fg_border = default_palette.grey[3]
  colors.bg_border = default_palette.grey[3]

  -- Git
  colors.git = {
    add = colors.green,
    change = colors.yellow,
    delete = colors.red,
    ignore = colors.dark3,
    untrcked = colors.teal,
  }
  colors.diff = {
    add = colors.Green.dark, -- background of added lines
    delete = colors.Red.dark, -- background of deleted lines
    change = colors.Light_blue.dark, -- background of changed lines
    text = colors.Cyan.dark, -- background of changed characters
  }

  -- Diagnostics
  colors.error = default_palette.red.dim
  colors.todo = default_palette.light_blue.dim
  colors.warning = default_palette.yellow.dim
  colors.info = default_palette.cyan.dim
  colors.hint = default_palette.teal.dim

  -- Misc
  colors.comment = default_palette.grey[4] -- slightly brighter than gutter

  colors.terminal_black = default_palette.black

  M.colors = colors

  return colors
end

return M
