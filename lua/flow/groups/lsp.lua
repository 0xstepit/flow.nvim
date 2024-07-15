local M = {}

-- Defines the highlight group colors for
-- the language server protocols.
-- @param c The available colors.
function M.get(c)
  local theme = {
    LspSignatureActiveParameter = { bg = c.bg_visual, bold = true }, -- parameter highlighter in signature help

    LspReferenceText = { bg = c.fg_gutter }, -- used for highlighting "text" references
    LspReferenceRead = { bg = c.fg_gutter }, -- used for highlighting "read" references
    LspReferenceWrite = { bg = c.fg_gutter }, -- used for highlighting "write" references

    LspCodeLens = { fg = c.comment },

    LspInlayHint = { fg = c.grey[6] },

    LspInfoBorder = { fg = c.brder_highlight, bg = c.bg_float },
  }

  return theme
end

return M
