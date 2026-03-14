local util = require("flow.util")
local hsl_to_hex = util.hsl_to_hex

--- @class HSL
--- @field h number Hue (0-360)
--- @field s number Saturation (0-100)
--- @field l number Lightness (0-100)
local HSL = {}
HSL.__index = HSL

--- @param h number
--- @param s number
--- @param l number
--- @return HSL
function HSL.new(h, s, l)
  return setmetatable({ h = h, s = s, l = l }, HSL)
end

local M = {
  fluo = {
    default = "pink",
    hue = {
      pink = 331,
      cyan = 187,
      green = 115,
      yellow = 61,
      orange = 25,
    },
    shade = {
      very_dark = { S = 25, L = 13 },
      dark = { S = 90, L = 25 },
      default = { S = 100, L = 50 },
      light = { S = 100, L = 77 },
      very_light = { S = 100, L = 90 },
    },
  },
  grey = {
    lightness = util.n_chebyshev_values(15, 10, 90),
    hue = 203,
    saturation = 20,
  },
  base = {
    hue = {
      red = 355,
      purple = 270,
      blue = 230,
      light_blue = 205,
      sky_blue = 190,
      cyan = 165,
      green = 115,
      yellow = 60,
      orange = 25,
    },
    shade = {
      very_dark = { S = 27, L = 20 },
      dark = { S = 50, L = 35 },
      default = { S = 40, L = 55 },
      light = { S = 40, L = 65 },
      very_light = { S = 50, L = 85 },
    },
  },
}

--- Build an n-step grey scale.
--- @param hue number Hue (0 for achromatic).
--- @param saturation number
--- @param lightness number[] Array of grey lightness values.
--- @return string[]
function M.build_greys(hue, saturation, lightness)
  local grey = {}
  for i = 1, #lightness do
    grey[i] = hsl_to_hex(hue, saturation, lightness[i])
  end
  return grey
end

--- Build a 5-shade color from a hue and shade definition.
--- @param h number Hue value
--- @param shade table Shade definitions with S (saturation) and L (light) for each level
--- @return table<string, string>
function M.build_color(h, shade)
  return {
    very_dark = hsl_to_hex(h, shade.very_dark.S, shade.very_dark.L),
    dark = hsl_to_hex(h, shade.dark.S, shade.dark.L),
    default = hsl_to_hex(h, shade.default.S, shade.default.L),
    light = hsl_to_hex(h, shade.light.S, shade.light.L),
    very_light = hsl_to_hex(h, shade.very_light.S, shade.very_light.L),
  }
end

--- Update default saturation and light of the selected mode if user provided
--- custom values.
--- @param shade table<string,table>
--- @param mode string
--- @param l string
--- @param s string
--- @return table<string, table>
function M.update_light_and_saturation(shade, mode, l, s)
  if l ~= "" then
    shade[mode].L = tonumber(l)
  end

  if s ~= "" then
    shade[mode].S = tonumber(s)
  end

  return shade
end

--- Generates and returns a color palette using HSL and HEX values.
--- @param config FlowConfig The available theme configuration options.
--- @return table<string,string>
function M.get(config)
  -- Deep copy to avoid mutating the module-level shade table across calls.
  local shade = vim.deepcopy(M.base.shade)

  local is_dark = config.theme.style == "dark"

  if is_dark then
    shade.default = { S = 60, L = 65 }
  end

  shade = M.update_light_and_saturation(
    shade,
    config.colors.mode,
    config.colors.custom.lightness,
    config.colors.custom.saturation
  )

  local palette = {
    -- Transparent color.
    transparent = "NONE",

    -- Base colors.
    black = hsl_to_hex(0, 0, 5),
    white = hsl_to_hex(0, 0, 95),

    -- Greyscale colors.
    grey = M.build_greys(M.grey.hue, M.grey.saturation, M.grey.lightness),

    -- Fluorescent colors.
    fluo = {
      pink = M.build_color(M.fluo.hue.pink, M.fluo.shade),
      orange = M.build_color(M.fluo.hue.orange, M.fluo.shade),
      cyan = M.build_color(M.fluo.hue.cyan, M.fluo.shade),
      green = M.build_color(M.fluo.hue.green, M.fluo.shade),
      yellow = M.build_color(M.fluo.hue.yellow, M.fluo.shade),
    },
  }

  -- Build chromatic colors.
  for name, h in pairs(M.base.hue) do
    palette[name] = M.build_color(h, shade)
  end

  return palette
end

return M
