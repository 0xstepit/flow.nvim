local M = {}

-- Defines the highlight group colors for completion.
-- @param c The available colors.
function M.get(c)
  local theme = {
    -- Documentation
    CmpDocumentation = { fg = c.fg, bg = c.bg_float },
    CmpDocumentationBorder = { bg = c.bg_float },

    CmpItemAbbr = { fg = c.fg, bg = c.none },
    CmpItemAbbrDeprecated = { fg = c.fg_gutter, bg = c.none, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.cyan, bg = c.none },
    CmpItemAbbrMatchFuzzy = { fg = c.cyan, bg = c.none },

    CmpItemMenu = { fg = c.comment, bg = c.none },

    CmpItemKindDefault = { fg = c.fg_dark, bg = c.none },

    CmpGhostText = { fg = c.terminal_black },

    CmpItemKindFunction = { link = "Function" },
  }

  return theme
end

return M
