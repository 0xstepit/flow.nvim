local util = require("flow.util")

local hsl = util.hsl_to_hex

local M = {}

---Generates and returns a color palette using HSL and HEX values.
---Each color family includes different shades: dark, dim, base,
---desaturated, and bright.
---@return table
function M.get()
  local palette = {
    -- Transparent color
    transparent = "NONE",

    -- Base colors
    black = hsl(0, 0, 5), -- Dark black
    white = hsl(0, 0, 95), -- Light white

    -- Fluorescent colors
    fluo = {
      pink = hsl(331, 100, 50), -- Fluorescent pink
      yellow = hsl(61, 100, 50), -- Fluorescent yellow
      green = hsl(115, 100, 50), -- Fluorescent green
      orange = hsl(25, 100, 50), -- Fluorescent orange
      cyan = hsl(187, 100, 50), -- Fluorescent cyan
    },

    -- Greyscale colors
    grey = {
      [1] = hsl(207, 22, 10), -- Very dark grey
      [2] = hsl(204, 20, 13), -- Dark grey
      [3] = hsl(205, 20, 30), -- Medium dark grey
      [4] = hsl(206, 20, 40), -- Medium grey
      [5] = hsl(205, 20, 65), -- Medium light grey
      [6] = hsl(205, 20, 75), -- Light grey
      [7] = hsl(204, 19, 85), -- Very light grey
    },

    -- Orange shades
    orange = {
      dark = hsl(25, 80, 15), -- Dark orange
      dim = hsl(25, 80, 40), -- Dim orange
      base = hsl(25, 80, 70), -- Base orange
      desat = hsl(25, 50, 70), -- Desaturated orange
      bright = hsl(25, 80, 80), -- Bright orange
    },

    -- Yellow shades
    yellow = {
      dark = hsl(55, 80, 15), -- Dark yellow
      dim = hsl(55, 80, 40), -- Dim yellow
      base = hsl(55, 80, 70), -- Base yellow
      desat = hsl(55, 50, 70), -- Desaturated yellow
      bright = hsl(55, 80, 80), -- Bright yellow
    },

    -- Red shades
    red = {
      dark = hsl(355, 80, 15), -- Dark red
      dim = hsl(355, 80, 40), -- Dim red
      base = hsl(355, 80, 70), -- Base red
      desat = hsl(355, 50, 70), -- Desaturated red
      bright = hsl(355, 80, 80), -- Bright red
    },

    -- Purple shades
    purple = {
      dark = hsl(265, 80, 15), -- Dark purple
      dim = hsl(265, 80, 40), -- Dim purple
      base = hsl(265, 80, 70), -- Base purple
      desat = hsl(265, 50, 70), -- Desaturated purple
      bright = hsl(265, 80, 80), -- Bright purple
    },

    -- Blue shades
    blue = {
      dark = hsl(235, 80, 15), -- Dark blue
      dim = hsl(235, 80, 40), -- Dim blue
      base = hsl(235, 80, 70), -- Base blue
      desat = hsl(235, 50, 70), -- Desaturated blue
      bright = hsl(235, 80, 80), -- Bright blue
    },

    -- Light blue shades
    light_blue = {
      dark = hsl(205, 80, 15), -- Dark light blue
      dim = hsl(205, 80, 40), -- Dim light blue
      base = hsl(205, 80, 70), -- Base light blue
      desat = hsl(205, 50, 70), -- Desaturated light blue
      bright = hsl(205, 80, 80), -- Bright light blue
    },

    -- Cyan shades
    cyan = {
      dark = hsl(175, 80, 15), -- Dark cyan
      dim = hsl(175, 80, 40), -- Dim cyan
      base = hsl(175, 80, 70), -- Base cyan
      desat = hsl(175, 50, 70), -- Desaturated cyan
      bright = hsl(175, 80, 80), -- Bright cyan
    },

    -- Teal shades
    teal = {
      dark = hsl(145, 80, 15), -- Dark teal
      dim = hsl(145, 80, 40), -- Dim teal
      base = hsl(145, 80, 70), -- Base teal
      desat = hsl(145, 50, 70), -- Desaturated teal
      bright = hsl(145, 80, 80), -- Bright teal
    },

    -- Green shades
    green = {
      dark = hsl(115, 80, 15), -- Dark green
      dim = hsl(115, 80, 40), -- Dim green
      base = hsl(115, 80, 70), -- Base green
      desat = hsl(115, 50, 70), -- Desaturated green
      bright = hsl(115, 80, 80), -- Bright green
    },
  }

  return palette
end

return M
