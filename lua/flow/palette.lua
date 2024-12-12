local util = require("flow.util")

local hsl = util.hsl_to_hex

local M = {}

-- TODO:
-- [ ] Define a specific color for virtual text

---Generates and returns a color palette using HSL and HEX values.
---@param opts FlowConfig
---@return table
-- TODO: should not receive opts
function M.get(opts)
  local very_dark = {
    S = 80,
    L = 15,
  }

  local dark = {
    S = 50,
    L = 25,
  }

  L_dyn = 70
  if not opts.dark_theme then
    L_dyn = 30
  end

  local base = {
    S = 80,
    L = L_dyn,
  }

  local base_desat = {
    S = 70,
    L = L_dyn,
  }

  local bright = {
    S = 80,
    L = 75,
  }

  local very_bright = {
    S = 50,
    L = 85,
  }

  local yellow_hue = 60
  local purple_hue = 270
  local cyan_hue = 165
  local blue_hue = 230

  local palette = {
    -- Transparent color
    transparent = "NONE",

    -- Base colors
    black = hsl(0, 0, 5), -- Dark black
    white = hsl(0, 0, 95), -- Light white

    -- Fluorescent colors
    fluo = {
      pink = {
        normal = hsl(331, 100, 50), -- Fluorescent pink
        light = hsl(331, 100, 90), -- Fluorescent pink light
        dark = hsl(331, 100, 10), -- Fluorescent pink dark
      },
      yellow = {
        normal = hsl(61, 100, 50), -- Fluorescent yellow
        light = hsl(61, 100, 90), -- Fluorescent yellow light
        dark = hsl(61, 100, 10), -- Fluorescent yellow dark
      },
      green = {
        normal = hsl(115, 100, 50), -- Fluorescent green
        light = hsl(115, 100, 90), -- Fluorescent green light
        dark = hsl(115, 100, 10), -- Fluorescent green dark
      },
      orange = {
        normal = hsl(25, 100, 50), -- Fluorescent orange
        light = hsl(25, 100, 90), -- Fluorescent orange light
        dark = hsl(25, 100, 50), -- Fluorescent orange dark
      },
      cyan = {
        normal = hsl(187, 100, 50), -- Fluorescent cyan
        light = hsl(187, 100, 90), -- Fluorescent cyan light
        dark = hsl(187, 100, 10), -- Fluorescent cyan dark
      },
    },

    -- Greyscale colors
    grey = {
      [1] = hsl(203, 20, 5), -- Very dark grey
      [2] = hsl(203, 20, 13), -- Dark grey
      [3] = hsl(203, 20, 30), -- Medium dark grey
      [4] = hsl(203, 20, 40), -- Medium grey
      [5] = hsl(203, 20, 65), -- Medium light grey
      [6] = hsl(203, 20, 75), -- Light grey
      [7] = hsl(203, 20, 85), -- Very light grey
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
      very_dark = hsl(yellow_hue, very_dark.S, very_dark.L),
      dark = hsl(yellow_hue, dark.S, dark.L),
      base = hsl(yellow_hue, base.S, base.L),
      desaturate = hsl(yellow_hue, base_desat.S, base_desat.L),
      bright = hsl(yellow_hue, bright.S, bright.L),
      very_bright = hsl(yellow_hue, very_bright.S, very_bright.L),
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
      very_dark = hsl(purple_hue, very_dark.S, very_dark.L),
      dark = hsl(purple_hue, dark.S, dark.L),
      base = hsl(purple_hue, base.S, base.L),
      desaturate = hsl(purple_hue, base_desat.S, base_desat.L),
      bright = hsl(purple_hue, bright.S, bright.L),
      very_bright = hsl(purple_hue, very_bright.S, very_bright.L),
    },

    -- Blue shades
    blue = {
      very_dark = hsl(blue_hue, very_dark.S, very_dark.L),
      dark = hsl(blue_hue, dark.S, dark.L),
      base = hsl(blue_hue, base.S, base.L),
      desaturate = hsl(blue_hue, base_desat.S, base_desat.L),
      bright = hsl(blue_hue, bright.S, bright.L),
      very_bright = hsl(blue_hue, very_bright.S, very_bright.L),
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

    -- Sky blue shades
    sky_blue = {
      very_dark = hsl(190, very_dark.S, very_dark.L),
      dark = hsl(190, dark.S, dark.L),
      base = hsl(190, base.S, base.L),
      desaturate = hsl(190, base_desat.S, base_desat.L),
      bright = hsl(190, bright.S, bright.L),
      very_bright = hsl(190, very_bright.S, very_bright.L),
    },

    -- Cyan shades
    cyan = {
      very_dark = hsl(cyan_hue, very_dark.S, very_dark.L),
      dark = hsl(cyan_hue, dark.S, dark.L),
      base = hsl(cyan_hue, base.S, base.L),
      desaturate = hsl(cyan_hue, base_desat.S, base_desat.L),
      bright = hsl(cyan_hue, bright.S, bright.L),
      very_bright = hsl(cyan_hue, very_bright.S, very_bright.L),
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
