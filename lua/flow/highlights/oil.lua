local M = {}

function M.get(colors, _)
  local theme = {
    OilFile = { fg = colors.cyan },
  }
  return theme
end

return M
