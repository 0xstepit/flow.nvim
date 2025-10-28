local M = {}

--- @param c table: The available colors.
--- @return table: FzfLua highlights.
function M.get(c, _)
  local theme = {
    WinBarSpecial = { fg = c.blue },
    FzfLuaBorder = { link = "Border" },
  }

  return theme
end

-- TelescopeNormal = { fg = c.fg, bg = c.transparent }, -- background float is the background where the text is
-- TelescopePromptNormal = { link = "TelescopeNormal" },
-- TelescopePreviewNormal = { link = "TelescopeNormal" },
-- TelescopeResultsNormal = { link = "TelescopeNormal" },
--
-- -- Selection
-- TelescopeSelectionCaret = { fg = c.bg_visual, bold = true },
-- TelescopeSelection = { fg = c.bg_visual, bold = true },
-- TelescopeMultiSelection = { fg = c.fg_visual, bg = c.bg_visual, bold = true }, -- Open telescope and press TAB on files.
-- TelescopeMultiIcon = { link = "TelescopeMultiSelection" }, -- Icon of selected items.
-- TelescopeMatching = { fg = c.blue, bold = true },
--
-- TelescopePromptPrefix = { bg = c.transparent, fg = c.bg_visual },
-- TelescopeResultsSpecialComment = { link = "gitDate" }, -- example: date in telescope git branches.
--
-- -- Titles
-- TelescopeResultsTitle = { bg = c.transparent, fg = c.fg_border },
-- TelescopePromptTitle = { link = "TelescopeResultsTitle" },
-- TelescopePreviewTitle = { link = "TelescopeResultsTitle" },
--
-- -- Borders
-- TelescopeBorder = { bg = c.transparent, fg = c.fg_border, bold = true },
-- TelescopePromptBorder = { link = "TelescopeBorder" },
-- TelescopePreviewBorder = { link = "TelescopeBorder" },
-- TelescopeResultsBorder = { link = "TelescopeBorder" },

return M
