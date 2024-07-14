local M = {}

function M.get(colors)
  local theme = {
    TelescopeNormal = { fg = colors.fg, bg = colors.bg_float }, -- background float is the background where the text is
    TelescopePromptNormal = { fg = colors.fg, bg = colors.bg_float },
    TelescopePreviewNormal = { fg = colors.fg, bg = colors.bg_float },
    TelescopeResultsNormal = { fg = colors.fg, bg = colors.bg_float },

    TelescopeMatching = { fg = colors.grey[4], bold = true },

    TelescopeSelection = { fg = colors.fluo, bg = colors.bg_float, bold = true },
    TelescopeSelectionCaret = { fg = colors.fluo, bold = true },

    TelescopePromptPrefix = { fg = colors.fluo, bg = colors.pink1 },

    TelescopeResultsTitle = { fg = colors.base, bg = colors.bg_float },
    TelescopePromptTitle = { link = "TelescopeResultsTitle" },
    TelescopePreviewTitle = { link = "TelescopeResultsTitle" },

    TelescopeBorder = { fg = colors.fg_gutter, bg = colors.bg_float, bold = true },
    TelescopePromptBorder = { link = "TelescopeBorder" },
    TelescopePreviewBorder = { link = "TelescopeBorder" },
    TelescopeResultsBorder = { link = "TelescopeBorder" },
  }

  return theme
end

return M
