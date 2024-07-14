local M = {}

-- Defines the highlight group colors for
-- the whichkey plugin.
-- @param c The available colors.
function M.get(c)
  local theme = {
    WhichKey = { fg = c.fluo },
    WhichKeyGroup = { fg = c.cyan },
    WhichKeyDesc = { fg = c.white },
    WhichKeyFloat = { bg = c.bg_popup },
    WhichKeyBorder = { fg = c.border }, -- require border to be activated in the plugin.

    -- WhichKeySeperator = { fg = c.teal },
    -- WhichKeyValue = { fg = c.red },
  }

  return theme
end

return M
