local M = {}

-- @param c The available colors.
function M.get(_, _)
  local theme = {
    MiniHipatternsTodo = { link = "Todo" },
    MiniHipatternsFixme = { link = "Fixme" },
    MiniHipatternsNote = { link = "Note" },
    MiniHipatternsHack = { link = "Hack" },
    MiniHipatternsWarn = { link = "Warn" },
  }
  return theme
end

return M
