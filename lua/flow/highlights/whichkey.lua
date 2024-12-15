local M = {}

-- Defines the highlight group colors for
-- the whichkey plugin.
-- @param c The available colors.
function M.get(c, options)
  local theme = {
    WhichKey = { fg = c.fg_visual },
    WhichKeyGroup = { fg = c.light_blue },
    WhichKeyDesc = { fg = c.fg_popup },
    WhichKeyFloat = { bg = c.bg_popup },
    WhichKeyBorder = { fg = c.fg_border }, -- Popup border: requires border to be activated in the plugin.
    WhichKeyTitle = { fg = c.fb_border },
  }

  return theme
end

return M
