local M = {}

-- Defines the highlight group colors for the flash.nvim plugins.
--- @param c table: The available colors.
--- @param o FlowConfig: The available options.
--- @return table: Diagnostic highlights.
function M.get(c, o)
  local is_dark = o.theme.style == "dark"

  local theme = {
    FlashBackdrop = { fg = c.comment },
    FlashLabel = { bg = c.fluo, fg = (not is_dark and c.grey[2]) or c.grey[7] },
  }

  return theme
end

return M
