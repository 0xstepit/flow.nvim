local util = require("flow.util")

local hsl = util.hsl_to_hex

local M = {}

---Generates and returns a color palette using HSL and HEX values.
---@return table
function M.get()
  local very_dark = {
    S = 80,
    L = 15,
  }

  local dark = {
    S = 50,
    L = 25,
  }

  local base = {
    S = 80,
    L = 50,
  }

  local base_desat = {
    S = 50,
    L = 70,
  }

  local bright = {
    S = 80,
    L = 75,
  }

  local very_bright = {
    S = 50,
    L = 85,
  }

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
      very_dark = hsl(25, very_dark.S, very_dark.L),
      dark = hsl(25, dark.S, dark.L),
      base = hsl(25, base.S, base.L),
      desaturate = hsl(25, 50, 70),
      bright = hsl(25, bright.S, bright.L),
      very_bright = hsl(25, very_bright.S, very_bright.L),
    },

    -- Yellow shades
    yellow = {
      very_dark = hsl(55, very_dark.S, very_dark.L),
      dark = hsl(55, dark.S, dark.L),
      base = hsl(55, base.S, base.L),
      desaturate = hsl(55, base_desat.S, base_desat.L),
      bright = hsl(55, bright.S, bright.L),
      very_bright = hsl(55, very_bright.S, very_bright.L),
    },

    -- Red shades
    red = {
      very_dark = hsl(355, very_dark.S, very_dark.L),
      dark = hsl(355, dark.S, dark.L),
      base = hsl(355, base.S, base.L),
      desaturate = hsl(355, base_desat.S, base_desat.L),
      bright = hsl(355, bright.S, bright.L),
      very_bright = hsl(355, very_bright.S, very_bright.L),
    },

    -- Purple shades
    purple = {
      very_dark = hsl(265, very_dark.S, very_dark.L),
      dark = hsl(265, dark.S, dark.L),
      base = hsl(265, base.S, base.L),
      desaturate = hsl(265, base_desat.S, base_desat.L),
      bright = hsl(265, bright.S, bright.L),
      very_bright = hsl(265, very_bright.S, very_bright.L),
    },

    -- Blue shades
    blue = {
      very_dark = hsl(235, very_dark.S, very_dark.L),
      dark = hsl(235, dark.S, dark.L),
      base = hsl(235, base.S, base.L),
      desaturate = hsl(235, base_desat.S, base_desat.L),
      bright = hsl(235, bright.S, bright.L),
      very_bright = hsl(235, very_bright.S, very_bright.L),
    },

    -- Light blue shades
    light_blue = {
      very_dark = hsl(205, very_dark.S, very_dark.L),
      dark = hsl(205, dark.S, dark.L),
      base = hsl(205, base.S, base.L),
      desaturate = hsl(205, base_desat.S, base_desat.L),
      bright = hsl(205, bright.S, bright.L),
      very_bright = hsl(205, very_bright.S, very_bright.L),
    },

    -- Cyan shades
    cyan = {
      very_dark = hsl(175, very_dark.S, very_dark.L),
      dark = hsl(175, dark.S, dark.L),
      base = hsl(175, base.S, base.L),
      desaturate = hsl(175, base_desat.S, base_desat.L),
      bright = hsl(175, bright.S, bright.L),
      very_bright = hsl(175, very_bright.S, very_bright.L),
    },

    -- Teal shades
    teal = {
      very_dark = hsl(145, very_dark.S, very_dark.L),
      dark = hsl(145, dark.S, dark.L),
      base = hsl(145, base.S, base.L),
      desaturate = hsl(145, base_desat.S, base_desat.L),
      bright = hsl(145, bright.S, bright.L),
      very_bright = hsl(145, very_bright.S, very_bright.L),
    },

    -- Green shades
    green = {
      very_dark = hsl(115, very_dark.S, very_dark.L),
      dark = hsl(115, dark.S, dark.L),
      base = hsl(115, base.S, base.L),
      desaturate = hsl(115, base_desat.S, base_desat.L),
      bright = hsl(115, bright.S, bright.L),
      very_bright = hsl(115, very_bright.S, very_bright.L),
    },
  }

  return palette
end

return M
