local M = {}

-- Defines the highlight group colors for the flash.nvim plugins.
--- @param c table: The available colors.
--- @param o FlowConfig: The available options.
--- @return table: Plugin highlights.
function M.get(c, o)
  local is_dark = o.theme.style == "dark"

  local theme = {
    FlashBackdrop = { fg = c.comment },
    FlashLabel = {
      -- bg = (not is_dark and c.Fluo.dark) or c.Fluo.light,
      bg = c.blue,
      fg = c.grey[2],
    },
  }

  return theme
end

return M
