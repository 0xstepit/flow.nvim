local M = {}

--- @param c table: The available colors.
--- @return table: Avante plugin highlights.
function M.get(c, _)
  local theme = {
    AvanteInlineHint = { fg = c.fluo },
    AvanteTitle = { bg = c.fluo, fg = c.grey[3] },
    AvanteReversedTitle = { bg = c.bg, fg = c.fluo },
    AvanteSubtitle = { fg = c.fluo },
    AvanteReversedSubtitle = { fg = c.bg },
    AvanteThirdTitle = { fg = c.light_blue },
    AvanteReversedThirdTitle = { fg = c.bg },
  }

  return theme
end

return M
