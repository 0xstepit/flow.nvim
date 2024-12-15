local util = require("flow.util")

local M = {}

function M.generate(colors)
  return util.interpolate(M.template, colors)
end

M.template = [=[
# Flow colorscheme | Alacritty
# https://github.com/0xstepit/flow.nvim

# Black and white
[colors.primary]
background = '${bg}'
foreground = '${fg}'

# Normal colors
[colors.normal]
black = '${black}'
red = '${red}'
green = '${green}'
yellow = '${yellow}'
blue = '${light_blue}'
magenta = '${purple}'
cyan = '${cyan}'
white = '${white}'

# Bright colors
[colors.bright]
black = '${black}'
red = '${red}'
green = '${green}'
yellow = '${yellow}'
blue = '${light_blue}'
magenta = '${purple}'
cyan = '${cyan}'
white = '${white}'

# Search colors
[colors.search.matches]
foreground = '${fluo}'
background = '${black}'

[colors.search.focused_match]
foreground = '${black}'
background = '${fluo}'

# Selection colors
[colors.selection]
background = '${fluo}'
text = '${black}'

# Cursors
# If you don't want to override original behavior, which is nice,
# remove [colors.cursor] and [colors.vi_mode_cursor].
[colors.cursor]
cursor = '${fluo}'
text = '${black}'

[colors.vi_mode_cursor]
cursor = '${fluo}'
text = '${black}'

[colors.footer_bar]
foreground = '${fluo}'
background = '${black}'

# Purple color
[[colors.indexed_colors]]
index = 93
color = '${purple}'

# Fluo Colors
[[colors.indexed_colors]]
index = 198
color = '${fluo}'
]=]

return M
