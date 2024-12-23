local M = {}

-- NOTE: for the generation of the extra's colorschemes, the transparency of
-- the background is not a relevant variable. The transparency is a property of the terminal
-- emulator and should be set according to its documentation.
function M.get_dark_themes(fluo_color)
  local moon_eclipse = {
    name = "moon-eclipse",
    config = {
      theme = {
        style = "dark",
      },
      colors = {
        mode = "default",
        fluo = fluo_color,
      },
      ui = {
        borders = "none",
      },
    },
  }

  local moon_penumbra = {
    name = "moon-penumbra",
    config = {
      theme = {
        style = "dark",
      },
      colors = {
        mode = "light",
        fluo = fluo_color,
      },
      ui = {
        borders = "none",
      },
    },
  }

  local moon_umbra = {
    name = "moon-umbra",
    config = {
      theme = {
        style = "dark",
      },
      colors = {
        mode = "dark",
        fluo = fluo_color,
      },
      ui = {
        borders = "none",
      },
    },
  }

  local theme = {
    moon_eclipse,
    moon_penumbra,
    moon_umbra,
  }
  return theme
end

function M.get_light_themes(fluo_color)
  local sun_eclipse = {
    name = "sun-eclipse",
    config = {
      theme = {
        style = "light",
      },
      colors = {
        mode = "default",
        fluo = fluo_color,
      },
      ui = {
        borders = "none",
      },
    },
  }

  local sun_penumbra = {
    name = "sun-penumbra",
    config = {
      theme = {
        style = "light",
      },
      colors = {
        mode = "light",
        fluo = fluo_color,
      },
      ui = {
        borders = "none",
      },
    },
  }

  local sun_umbra = {
    name = "sun-umbra",
    config = {
      theme = {
        style = "light",
      },
      colors = {
        mode = "dark",
        fluo = fluo_color,
      },
      ui = {
        borders = "none",
      },
    },
  }

  local theme = {
    sun_eclipse,
    sun_penumbra,
    sun_umbra,
  }
  return theme
end

return M
