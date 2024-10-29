local M = {}

-- Note that for the generation of the extra's colorschemes, the transparency of
-- the background is not a relevant variable. For the terminal emulator, the
-- transparency should be set according to its documentation.
function M.get_dark_theme(fluo_color)
  local eclipse = {
    -- Themes colors
    name = "eclipse",
    light_theme = false,
    mode = "desaturate",

    -- Variables
    fluo_color = fluo_color,
  }
  local theme = {
    eclipse,
  }
  return theme
end

function M.get_light_theme(fluo_color)
  local eclipse = {
    -- Themes colors
    name = "bloom",
    light_theme = true,
    mode = "dark",

    -- Variables
    fluo_color = fluo_color,
  }
  local theme = {
    eclipse,
  }
  return theme
end

return M
