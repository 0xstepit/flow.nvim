local M = {}

-- Note that for the generation of the extra's colorschemes, the transparency of
-- the background is not a relevant variable. For the terminal emulator, the
-- transparency should be set according to its documentation.
function M.get_dark_theme(fluo_color)
  local eclipse = {
    name = "eclipse",
    dark_theme = true,
    mode = "base",
    fluo_color = fluo_color,
  }

  local bloom = {
    name = "bloom",
    dark_theme = true,
    mode = "desaturate",
    fluo_color = fluo_color,
  }
  local theme = {
    eclipse,
    bloom,
  }
  return theme
end

function M.get_light_theme(fluo_color)
  local light = {
    -- Themes colors
    name = "light",
    dark_theme = false,
    mode = "dark",

    -- Variables
    fluo_color = fluo_color,
  }
  local theme = {
    light,
  }
  return theme
end

return M
