local M = {}

function M.get()
  local palette = {
    transparent = "NONE",

    black = "#0D0D0D",
    white = "#F2F2F2",

    fluo = {
      pink = "#FF007C",
      yellow = "#FAFF00",
      green = "#14FF00",
      orange = "#FF7A00",
    },

    -- Greys
    grey = {
      [1] = "#141A1F",
      [2] = "#1B2228",
      [3] = "#3D4F5C",
      [4] = "#52697A",
      [5] = "#94A9B8",
      [6] = "#B2C1CC",
      [7] = "#D1DAE0",
    },

    orange = {
      dim = "#8A420F",
      base = "#F0A875",
      bright = "#F5C5A3",
    },

    yellow = {
      dim = "#8A7F0F",
      base = "#F0E575",
      bright = "#F5EEA3",
    },

    red = {
      dark = "#422426",
      dim = "#8A0F19",
      base = "#F07580",
      bright = "#F5A3AA",
    },

    purple = {
      dim = "#420F8A",
      base = "#A875F0",
      bright = "#C5A3F5",
    },

    blue = {
      dark = "#242642",
      dim = "#0F198A",
      base = "#7580F0",
      bright = "#A3AAF5",
    },

    light_blue = {
      dim = "#0F578A",
      base = "#75BDF0",
      bright = "#A3D3F5",
    },

    cyan = {
      dim = "#0F8A80",
      base = "#75F0E6",
      bright = "#A3F5EE",
    },

    teal = {
      dim = "#0F8A42",
      base = "#75F0A8",
      bright = "#A3F5C5",
    },

    green = {
      dark = "#264224",
      dim = "#198A0F",
      base = "#80F075",
      bright = "#AAF5A3",
    },
  }

  return palette
end

return M
