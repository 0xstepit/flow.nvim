local M = {}

--- @return table: Mini files plugin highlights.
function M.get(c, _)
  local theme = {
    MiniFilesFile = { link = "Function" },
    MiniFilesBorderModified = { fg = c.fluo },
  }
  return theme
end

return M
