local M = {}

--- @param c table: The available colors.
--- @return table: Avante plugin highlights.
function M.get(c, _)
  local theme = {
    AvanteInlineHint = { fg = c.fluo },

    AvanteTitle = { link = "FlowPluginTitle" },
    AvanteReversedTitle = { link = "AvanteTitle" },
    AvanteSubtitle = { link = "AvanteTitle" },
    AvanteReversedSubtitle = { link = "AvanteTitle" },
    AvanteThirdTitle = { link = "AvanteTitle" },

    AvanteReversedThirdTitle = { fg = c.bg },
    AvanteSidebarWinSeparator = { link = "Border" },
  }

  return theme
end

return M
