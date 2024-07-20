package.path = package.path .. ";../?.lua;../flow/?.lua"

local util = require("util")

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

# Fluo Colors
[[colors.indexed_colors]]
index = 198
color = '${fluo}'
]=]

return M
