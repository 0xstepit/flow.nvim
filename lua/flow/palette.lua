local hsl = require("flow.util").hsl_to_hex

local M = {}

---Generates and returns a color palette using HSL and HEX values.
---@return table
function M.get(opts)
  -- The colorscheme support 5 shades of colors.
  local shade = {
    very_dark = { S = 27, L = 20 },
    dark = { S = 50, L = 35 },
    default = {
      S = (not opts.dark_theme and 40) or 50,
      L = (not opts.dark_theme and 55) or 65,
    },
    bright = { S = 80, L = 75 },
    very_bright = { S = 50, L = 85 },
  }

  local hue = {
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

  local fluo_hue = {
    pink = 331,
    cyan = 187,
    green = 115,
    yellow = 61,
    orange = 25,
  }

  local palette = {
    -- Transparent color
    transparent = "NONE",

    -- Base colors
    black = hsl(0, 0, 5),
    white = hsl(0, 0, 95),

    -- Greyscale colors
    grey = {
      [1] = hsl(203, 20, 10), -- Very dark grey
      [2] = hsl(203, 20, 13), -- Very dark grey
      [3] = hsl(203, 20, 15),
      [4] = hsl(203, 20, 30),
      [5] = hsl(203, 20, 35),
      [6] = hsl(203, 20, 65),
      [7] = hsl(203, 20, 85),
      [8] = hsl(203, 20, 88),
      [9] = hsl(203, 20, 90), -- Very bright grey
    },

    -- Fluorescent colors
    fluo = {
      pink = {
        default = hsl(fluo_hue.pink, 100, 50),
        light = hsl(fluo_hue.pink, 100, 90),
        dark = hsl(fluo_hue.pink, 100, 30),
      },
      cyan = {
        default = hsl(fluo_hue.cyan, 100, 50),
        light = hsl(fluo_hue.cyan, 100, 90),
        dark = hsl(fluo_hue.cyan, 100, 30),
      },
      green = {
        default = hsl(fluo_hue.green, 100, 50),
        light = hsl(fluo_hue.green, 100, 90),
        dark = hsl(fluo_hue.green, 100, 30),
      },
      orange = {
        default = hsl(fluo_hue.orange, 100, 50),
        light = hsl(fluo_hue.orange, 100, 90),
        dark = hsl(fluo_hue.orange, 100, 30),
      },
      yellow = {
        default = hsl(fluo_hue.yellow, 100, 50),
        light = hsl(fluo_hue.yellow, 100, 90),
        dark = hsl(fluo_hue.yellow, 100, 30),
      },
    },

    -- Red shades
    red = {
      very_dark = hsl(hue.red, shade.very_dark.S, shade.very_dark.L),
      dark = hsl(hue.red, shade.dark.S, shade.dark.L),
      default = hsl(hue.red, shade.default.S, shade.default.L),
      bright = hsl(hue.red, shade.bright.S, shade.bright.L),
      very_bright = hsl(hue.red, shade.very_bright.S, shade.very_bright.L),
    },

    -- Purple shades
    purple = {
      very_dark = hsl(hue.purple, shade.very_dark.S, shade.very_dark.L),
      dark = hsl(hue.purple, shade.dark.S, shade.dark.L),
      default = hsl(hue.purple, shade.default.S, shade.default.L),
      bright = hsl(hue.purple, shade.bright.S, shade.bright.L),
      very_bright = hsl(hue.purple, shade.very_bright.S, shade.very_bright.L),
    },

    -- Blue shades
    blue = {
      very_dark = hsl(hue.blue, shade.very_dark.S, shade.very_dark.L),
      dark = hsl(hue.blue, shade.dark.S, shade.dark.L),
      default = hsl(hue.blue, shade.default.S, shade.default.L),
      bright = hsl(hue.blue, shade.bright.S, shade.bright.L),
      very_bright = hsl(hue.blue, shade.very_bright.S, shade.very_bright.L),
    },

    -- Light blue shades
    light_blue = {
      very_dark = hsl(hue.light_blue, shade.very_dark.S, shade.very_dark.L),
      dark = hsl(hue.light_blue, shade.dark.S, shade.dark.L),
      default = hsl(hue.light_blue, shade.default.S, shade.default.L),
      bright = hsl(hue.light_blue, shade.bright.S, shade.bright.L),
      very_bright = hsl(hue.light_blue, shade.very_bright.S, shade.very_bright.L),
    },

    -- Sky blue shades
    sky_blue = {
      very_dark = hsl(hue.sky_blue, shade.very_dark.S, shade.very_dark.L),
      dark = hsl(hue.sky_blue, shade.dark.S, shade.dark.L),
      default = hsl(hue.sky_blue, shade.default.S, shade.default.L),
      bright = hsl(hue.sky_blue, shade.bright.S, shade.bright.L),
      very_bright = hsl(hue.sky_blue, shade.very_bright.S, shade.very_bright.L),
    },

    -- Cyan shades
    cyan = {
      very_dark = hsl(hue.cyan, shade.very_dark.S, shade.very_dark.L),
      dark = hsl(hue.cyan, shade.dark.S, shade.dark.L),
      default = hsl(hue.cyan, shade.default.S, shade.default.L),
      bright = hsl(hue.cyan, shade.bright.S, shade.bright.L),
      very_bright = hsl(hue.cyan, shade.very_bright.S, shade.very_bright.L),
    },

    -- Green shades
    green = {
      very_dark = hsl(hue.green, shade.very_dark.S, shade.very_dark.L),
      dark = hsl(hue.green, shade.dark.S, shade.dark.L),
      default = hsl(hue.green, shade.default.S, shade.default.L),
      bright = hsl(hue.green, shade.bright.S, shade.bright.L),
      very_bright = hsl(hue.green, shade.very_bright.S, shade.very_bright.L),
    },

    -- Orange shades
    orange = {
      very_dark = hsl(hue.orange, shade.very_dark.S, shade.very_dark.L),
      dark = hsl(hue.orange, shade.dark.S, shade.dark.L),
      default = hsl(hue.orange, shade.default.S, shade.default.L),
      bright = hsl(hue.orange, shade.bright.S, shade.bright.L),
      very_bright = hsl(hue.orange, shade.very_bright.S, shade.very_bright.L),
    },

    -- Yellow shades
    yellow = {
      very_dark = hsl(hue.yellow, shade.very_dark.S, shade.very_dark.L),
      dark = hsl(hue.yellow, shade.dark.S, shade.dark.L),
      default = hsl(hue.yellow, shade.default.S, shade.default.L),
      bright = hsl(hue.yellow, shade.bright.S, shade.bright.L),
      very_bright = hsl(hue.yellow, shade.very_bright.S, shade.very_bright.L),
    },
  }

  return palette
end

return M
