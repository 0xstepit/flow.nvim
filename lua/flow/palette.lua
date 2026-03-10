local hsl = require("flow.util").hsl_to_hex

local M = {}

--- Default fluo light values.
M.fluo_lightness = {
  default = 50,
  light = 90,
  dark = 35,
}

--- Default grey lightness steps used by both chromatic and monochrome palettes.
M.grey_lightness = { 10, 13, 15, 18, 24, 29, 50, 65, 85, 88, 90 }

--- Default grey hue for the chromatic palette.
M.grey_hue = 203
--- Default grey saturation for the chromatic palette.
M.grey_saturations = { 20, 20, 20, 12, 15, 20, 20, 20, 20, 20, 20 }

M.hue = {
  red = 355,
  purple = 270,
  blue = 230,
  light_blue = 205,
  sky_blue = 190,
  cyan = 165,
  green = 115,
  yellow = 60,
  orange = 25,
}

M.fluo_hue = {
  pink = 331,
  cyan = 187,
  green = 115,
  yellow = 61,
  orange = 25,
}

--- Build an 11-step grey scale.
--- @param h_value number Hue (0 for achromatic).
--- @param s_values table Array of 11 saturation values.
--- @param l_values table Array of 11 lightness values.
--- @return table
function M.build_greys(h_value, s_values, l_values)
  local grey = {}
  for i = 1, 11 do
    grey[i] = hsl(h_value, s_values[i], l_values[i])
  end
  return grey
end

--- Build a 5-shade color from a hue and shade definition.
--- @param h number Hue value
--- @param shade table Shade definitions with S (saturation) and L (light) for each level
--- @return table
function M.build_color(h, shade)
  return {
    very_dark = hsl(h, shade.very_dark.S, shade.very_dark.L),
    dark = hsl(h, shade.dark.S, shade.dark.L),
    default = hsl(h, shade.default.S, shade.default.L),
    light = hsl(h, shade.light.S, shade.light.L),
    very_light = hsl(h, shade.very_light.S, shade.very_light.L),
  }
end

--- Build a 3-shade fluorescent color.
--- @param h number Hue value.
--- @param light_l number? Optional lightness for light shade.
--- @param dark_l number? Optional lightness for dark shade.
--- @return table
function M.build_fluo(h, light_l, dark_l)
  return {
    default = hsl(h, 100, M.fluo_lightness.default),
    light = hsl(h, 100, light_l or M.fluo_lightness.light),
    dark = hsl(h, 100, dark_l or M.fluo_lightness.dark),
  }
end

--- Generates and returns a color palette using HSL and HEX values.
--- @param config FlowConfig: The available theme configuration options.
--- @return table
function M.get(config)
  local is_dark = config.theme.style == "dark"

  local shade = {
    very_dark = { S = 27, L = 20 },
    dark = { S = 50, L = 35 },
    default = { S = (not is_dark and 40) or 60, L = (not is_dark and 55) or 65 },
    light = { S = 40, L = 65 },
    very_light = { S = 50, L = 85 },
  }

  if config.colors.custom.light ~= "" then
    ---@diagnostic disable-next-line: assign-type-mismatch
    shade[config.colors.mode].L = tonumber(config.colors.custom.light)
  end

  if config.colors.custom.saturation ~= "" then
    ---@diagnostic disable-next-line: assign-type-mismatch
    shade[config.colors.mode].S = tonumber(config.colors.custom.saturation)
  end

  -- Get the configured fluo color.
  local configured_fluo = (config.colors and config.colors.fluo) or "pink"
  local fluo_hue_value = M.fluo_hue[configured_fluo]

  local palette = {
    -- Transparent color.
    transparent = "NONE",

    -- Base colors.
    black = hsl(0, 0, 5),
    white = hsl(0, 0, 95),

    -- Greyscale colors.
    grey = M.build_greys(M.grey_hue, M.grey_saturations, M.grey_lightness),

    -- CursorLine background.
    cursorline_bg = {
      dark = hsl(fluo_hue_value, 20, 13), -- For dark theme
      light = hsl(fluo_hue_value, 20, 87), -- For light theme
    },

    -- Visual selection background.
    visual_bg = {
      dark = hsl(fluo_hue_value, 90, 23), -- For dark theme
      light = hsl(fluo_hue_value, 90, 77), -- For light theme
    },

    -- Float window colors.
    float_bg = {
      dark = hsl(203, 20, 18), -- For dark theme
      light = hsl(203, 20, 82), -- For light theme
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
  for name, h in pairs(M.hue) do
    palette[name] = M.build_color(h, shade)
  end

  return palette
end

return M
