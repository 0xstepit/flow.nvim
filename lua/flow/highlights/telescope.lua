local M = {}

function M.get(c)
  local theme = {
    -- Normal text
    TelescopeNormal = { fg = c.fg, bg = c.bg_float }, -- background float is the background where the text is
    TelescopePromptNormal = { link = "TelescopeNormal" },
    TelescopePreviewNormal = { link = "TelescopeNormal" },
    TelescopeResultsNormal = { link = "TelescopeNormal" },

    -- Selection
    TelescopeSelectionCaret = { fg = c.fg_visual, bold = true },
    TelescopeSelection = { fg = c.fg_visual, bold = true },
    TelescopeMultiSelection = { fg = c.bg_visual, bg = c.fg_visual, bold = true }, -- Open telescope and press TAB on files.
    TelescopeMultiIcon = { link = "TelescopeMultiSelection" }, -- Icon of selected items.
    TelescopeMatching = { fg = c.comment, bold = true },

    TelescopePromptPrefix = { fg = c.fg_visual, bg = c.bg_float },

    -- Titles
    TelescopeResultsTitle = { fg = c.fg_gutter, bg = c.bg_float },
    TelescopePromptTitle = { link = "TelescopeResultsTitle" },
    TelescopePreviewTitle = { link = "TelescopeResultsTitle" },

    -- Borders
    TelescopeBorder = { fg = c.fg_border, bg = c.bg_float, bold = true },
    TelescopePromptBorder = { link = "TelescopeBorder" },
    TelescopePreviewBorder = { link = "TelescopeBorder" },
    TelescopeResultsBorder = { link = "TelescopeBorder" },
  }

  return theme
end

return M
