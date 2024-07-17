local M = {}

-- Defines the highlight group colors for diagnostic.
-- @param c The available colors.
function M.get(c)
  local theme = {
    TodoBgTODO = { fg = c.bg, bg = c.Teal.bright },
    TodoFgTODO = { bg = c.bg, fg = c.Teal.bright },
    TodoBgWARN = { fg = c.bg, bg = c.Yellow.bright },
    TodoFgWARN = { bg = c.bg, fg = c.Yellow.bright },
    TodoBgFIX = { fg = c.bg, bg = c.Red.bright },
    TodoFgFIX = { bg = c.bg, fg = c.Red.bright },
    TodoBgNOTE = { fg = c.bg, bg = c.Light_blue.bright },
    TodoFgNOTE = { bg = c.bg, fg = c.Light_blue.bright },
  }

  return theme
end

return M
