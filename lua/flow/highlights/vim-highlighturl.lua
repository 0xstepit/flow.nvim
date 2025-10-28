local M = {}

--- @param c table: The available colors.
--- @return table:
function M.get(c, _)
  local theme = {
    HighlightUrl = { fg = c.cyan, undercurl = true },
  }

  return theme
end

return M
