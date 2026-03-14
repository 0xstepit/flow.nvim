local hsl = require("flow.util").hsl_to_hex

local M = {}

--- Cool blue hue and low saturation for a metallic/steel tone on syntax colors.
M.hue = 220
M.sat = 3

--- Lightness values for desaturated chromatic color replacements.
--- Each color maps to a unique grey lightness for visual distinction.
--- @type table<string, number>
M.dark_lightness = {
  light_blue = 75,
  cyan = 68,
  purple = 50,
  yellow = 82,
  green = 62,
  orange = 72,
  blue = 55,
  sky_blue = 78,
  -- red is special: replaced by fluo
}

--- Build a 5-shade metallic color at a given base lightness.
--- @param base_l number Base lightness (0-100)
--- @return table
local function metallic_shades(base_l)
  return {
    very_dark = hsl(M.hue, M.sat, math.max(base_l - 30, 5)),
    dark = hsl(M.hue, M.sat, math.max(base_l - 15, 10)),
    default = hsl(M.hue, M.sat, base_l),
    light = hsl(M.hue, M.sat, math.min(base_l + 10, 90)),
    very_light = hsl(M.hue, M.sat, math.min(base_l + 20, 95)),
  }
end

--- Apply monochrome transformation to the colors table.
--- Desaturates chromatic syntax colors to metallic grey shades and maps
--- keywords (red) to the fluorescent accent color.
--- Greys, black, white, and all UI scaffolding colors are left untouched.
--- @param colors table The colors table from colors.setup()
--- @param opts FlowConfig The configuration options
function M.apply(colors, opts)
  local is_dark = opts.theme.style == "dark"

  -- 1. Desaturate chromatic colors to unique metallic grey lightness values
  for name, base_l in pairs(M.dark_lightness) do
    local l = is_dark and base_l or (100 - base_l)
    colors[name] = hsl(M.hue, M.sat, l)
    local Key = name:gsub("^%l", string.upper)
    colors[Key] = metallic_shades(l)
  end

  -- 2. Override red → fluo (keywords/operators use c.red in syntax.lua)
  colors.red = colors.fluo
  colors.Red = {
    very_dark = colors.Fluo.dark,
    dark = colors.Fluo.dark,
    default = colors.Fluo.default,
    light = colors.Fluo.light,
    very_light = colors.Fluo.light,
  }

  -- 3. Remap semantic colors
  -- Diagnostics: fluo shades for error/warning/info, grey for hint
  colors.error = colors.Fluo.default
  colors.warning = colors.Fluo.dark
  colors.info = colors.Fluo.light
  colors.hint = colors.grey[7]

  -- Git: distinct metallic grey values
  colors.git = {
    add = colors.green,
    change = colors.light_blue,
    delete = colors.red,
    ignore = colors.grey[7],
    untracked = colors.sky_blue,
  }

  -- Diff: use existing greys for subtle background differences
  local n = #colors.grey
  colors.diff = {
    add = is_dark and colors.grey[4] or colors.grey[n - 3],
    delete = is_dark and colors.grey[2] or colors.grey[n - 1],
    change = is_dark and colors.grey[5] or colors.grey[n - 4],
    text = is_dark and colors.grey[4] or colors.grey[n - 3],
    parent = is_dark and colors.grey[5] or colors.grey[n - 4],
  }

  -- Parentheses/brackets: use fluo accent, dark shade for dark theme, light for light.
  colors.bracket = is_dark and colors.Fluo.dark or colors.Fluo.light

  -- Comments: use a grey that's clearly dimmer than syntax elements
  colors.comment = is_dark and colors.grey[6] or colors.grey[6]

  -- Special comments: fluo for fixme (urgent), grey for others
  colors.fixme = colors.Fluo.default
  colors.todo = is_dark and colors.grey[9] or colors.grey[2]
  colors.note = is_dark and colors.grey[8] or colors.grey[3]
  colors.hack = is_dark and colors.grey[7] or colors.grey[4]
end

return M
