local M = {}

-- Defines the highlight group colors for trouble.
-- @param c The available colors.
function M.get(c)
  local theme = {
    -- LspTrouble
    TroubleText = { fg = c.fg_dark },
    TroubleCount = { fg = c.purple, bg = c.fg_gutter },
    TroubleNormal = { fg = c.fg, bg = c.bg_sidebar },
  }

  return theme
end

return M
