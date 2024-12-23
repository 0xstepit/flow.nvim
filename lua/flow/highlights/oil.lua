local M = {}

--- @param c table: The available colors.
--- @return table: Oil plugin highlights.
function M.get(c, _)
  local theme = {
    OilFile = { fg = c.cyan },
  }
  return theme
end

return M
