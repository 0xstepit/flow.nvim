local M = {}

function M.get(_, _)
  local theme = {}
  theme = {
    TodoBgTODO = { link = "Todo" },
    TodoFgTODO = { link = "Comment" },
    TodoBgWARN = { link = "Warn" },
    TodoFgWARN = { link = "Comment" },
    TodoBgFIX = { link = "Fixme" },
    TodoFgFIX = { link = "Comment" },
    TodoBgNOTE = { link = "Note" },
    TodoFgNOTE = { link = "Comment" },
  }

  return theme
end

return M
