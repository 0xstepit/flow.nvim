local M = {}

--- @return table: Mini hi plugin highlights.
function M.get(_, _)
  local theme = {
    MiniHipatternsTodo = { link = "Todo" },
    MiniHipatternsFixme = { link = "Fixme" },
    MiniHipatternsNote = { link = "Note" },
    MiniHipatternsHack = { link = "Hack" },
    MiniHipatternsContract = { link = "Fixme" },
  }
  return theme
end

return M
