local M = {}

-- Defines the highlight group colors for trouble.
--- @param c table: The available colors.
--- @return table: Trouble plugin highlights.
function M.get(c, _)
  local theme = {
    -- LspTrouble
    TroubleText = { fg = c.to_check },
    TroubleCount = { fg = c.red, bg = c.fg_gutter },
    TroubleDiagnosticsBasename = { fg = c.light_blue },
  }

  return theme
end
return M
