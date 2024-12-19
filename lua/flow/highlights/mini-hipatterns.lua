local M = {}

--- @param c table: The available colors.
--- @return table: Mini hi plugin highlights.
function M.get(c, _)
  local theme = {
    MiniHipatternsTodo = { link = "Todo" },
    MiniHipatternsFixme = { link = "Fixme" },
    MiniHipatternsNote = { link = "Note" },
    MiniHipatternsHack = { link = "Hack" },
    MiniHipatternsWarn = { link = "Warn" },
    MiniHipatternsContract = { fg = c.fluo, bg = c.comment },
  }
  return theme
end

return M
