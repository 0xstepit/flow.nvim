local M = {}

-- NOTE: for the generation of the extra's colorschemes, the transparency of
-- the background is not a relevant variable. The transparency is a property of the terminal
-- emulator and should be set according to its documentation.
function M.get_dark_themes(fluo_color)
  local eclipse = {
    name = "eclipse",
    dark_theme = true,
    mode = "default",
    fluo_color = fluo_color,
  }

  local theme = {
    eclipse,
  }
  return theme
end

function M.get_light_themes(fluo_color)
  local light = {
    name = "light",
    dark_theme = false,
    mode = "dark",
    fluo_color = fluo_color,
  }

  local theme = {
    light,
  }
  return theme
end

return M
