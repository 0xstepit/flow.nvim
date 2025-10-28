local M = {}

--- @param c table: The available colors.
--- @return table: WinBar highlights.
function M.get(c, _)
  local theme = {
    WinBarSpecial = { fg = c.blue },
    WinBarFile = { fg = c.cyan },
    WinBarPath = { fg = c.comment },
  }

  return theme
end

return M
