local M = {}

function M.get(_, _)
  local theme = {
    IblIndent = { link = "Comment" },
    IblWhiteSpace = { link = "IblIndent" },
  }
  return theme
end

return M
