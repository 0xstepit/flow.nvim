local M = {}

-- Defines the highlight group colors for trouble.
-- @param c The available colors.
function M.get(c, options)
  local theme = {
    -- LspTrouble
    TroubleText = { fg = c.fg_dark },
    TroubleCount = { fg = c.red, bg = c.fg_gutter },
    TroubleDiagnosticsBasename = { fg = c.light_blue },
  }

  return theme
end
return M
