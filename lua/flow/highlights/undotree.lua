local M = {}

function M.get(c, _)
  local theme = {
    UndotreeTimeStamp = { fg = c.fg },
    UndotreeNode = { fg = c.cyan },
    UndotreeBranch = { fg = c.grey[4] },
  }

  return theme
end

return M
