local M = {}

--- @param c table: The available colors.
--- @return table: Whichkey plugin highlights.
function M.get(c, _)
  local theme = {
    WhichKey = { fg = c.bg_visual },
    WhichKeyGroup = { fg = c.light_blue },
    WhichKeyDesc = { fg = c.fg_popup },
    WhichKeyFloat = { bg = c.bg_popup },
    WhichKeyBorder = { link = "FloatBorder" },
    WhichKeyTitle = { link = "FlowPluginTitle" },
  }

  return theme
end

return M
