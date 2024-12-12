local M = {}

function M.get(c, _)
  local theme = {
    AvanteInlineHint = { fg = c.fluo },
    AvanteTitle = { bg = c.fluo, fg = c.grey[2] },
    AvanteReversedTitle = { bg = c.fluo, fg = c.grey[2] },
    AvanteSubtitle = { fg = c.fluo },
  }

  return theme
end

return M
