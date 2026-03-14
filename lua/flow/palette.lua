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

local function n_equidistant_values(n, range)
  assert(n >= 2, "number of points should be >= 2")
  local step = math.floor(range / n)

  local values = {}
  for i = 0, n do
    values[i + 1] = i * step + step
  end

  return values
end

--- Generate n+1 Chebyshev-spaced values over [low, high].
--- Nodes cluster near both endpoints, giving finer gradation in the
--- darks and lights with wider spacing through the mid-tones.
local function n_chebyshev_values(n, low, high)
  assert(n >= 2, "number of points should be >= 2")

  local values = {}
  for i = 0, n do
    -- Chebyshev nodes on [-1, 1]: cos(i * pi / n), mapped to [low, high]
    local node = math.cos(i * math.pi / n)
    values[i + 1] = math.floor((1 - node) / 2 * (high - low) + low + 0.5)
  end

  return values
end

local M = {
  default_fluo = "pink",

  --- Default fluo values.
  fluo_lightness = {
    default = 50,
    light = 90,
    dark = 35,
  },

  fluo_saturation = 100,

  fluo_hue = {
    pink = 331,
    cyan = 187,
    green = 115,
    yellow = 61,
    orange = 25,
  },

  --- Default grey lightness steps used by both chromatic and monochrome palettes.
  grey_lightness = util.n_chebyshev_values(15, 10, 90),

  --- Default grey hue for the chromatic palette.
  grey_hue = 203,

  --- Default grey saturation for the chromatic palette.
  grey_saturation = 20,

  color_hue = {
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

--- Build a 3-shade fluorescent color.
--- @param h number Hue value.
--- @param light_l number? Optional lightness for light shade.
--- @param dark_l number? Optional lightness for dark shade.
--- @return table<string, string>
function M.build_fluo(h, light_l, dark_l)
  return {
    dark = hsl_to_hex(h, M.fluo_saturation, dark_l or M.fluo_lightness.dark),
    default = hsl_to_hex(h, M.fluo_saturation, M.fluo_lightness.default),
    light = hsl_to_hex(h, M.fluo_saturation, light_l or M.fluo_lightness.light),
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
  local shade = M.shade

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

  -- Get the configured fluo color.
  local configured_fluo = (config.colors and config.colors.fluo) or M.default_fluo
  local fluo_hue_value = M.fluo_hue[configured_fluo]

  local palette = {
    -- Transparent color.
    transparent = "NONE",

    -- Base colors.
    black = hsl_to_hex(0, 0, 5),
    white = hsl_to_hex(0, 0, 95),

    -- Greyscale colors.
    grey = M.build_greys(M.grey_hue, M.grey_saturation, M.grey_lightness),

    -- CursorLine background.
    cursorline_bg = {
      dark = hsl_to_hex(fluo_hue_value, 20, 13), -- For dark theme
      light = hsl_to_hex(fluo_hue_value, 20, 87), -- For light theme
    },

    -- Visual selection background.
    visual_bg = {
      dark = hsl_to_hex(fluo_hue_value, 90, 23), -- For dark theme
      light = hsl_to_hex(fluo_hue_value, 90, 77), -- For light theme
    },

    -- Float window colors.
    float_bg = {
      dark = hsl_to_hex(203, 20, 18), -- For dark theme
      light = hsl_to_hex(203, 20, 82), -- For light theme
    },

    -- Fluorescent colors.
    fluo = {
      pink = M.build_fluo(M.fluo_hue.pink),
      orange = M.build_fluo(M.fluo_hue.orange),
      cyan = M.build_fluo(M.fluo_hue.cyan, 90, 30),
      green = M.build_fluo(M.fluo_hue.green, 100, 30),
      yellow = M.build_fluo(M.fluo_hue.yellow, 90, 30),
    },
  }

  -- Build chromatic colors.
  for name, h in pairs(M.color_hue) do
    palette[name] = M.build_color(h, shade)
  end

  return palette
end

return M
