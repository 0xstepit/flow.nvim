local M = {}

-- Defines the highlight group colors for
-- the language server protocols.
-- @param c The available colors.
function M.get(c)
  local theme = {
    LspReferenceText = { bg = c.fg_gutter }, -- used for highlighting "text" references
    LspReferenceRead = { bg = c.fg_gutter }, -- used for highlighting "read" references
    LspReferenceWrite = { bg = c.fg_gutter }, -- used for highlighting "write" references
    LspSignatureActiveParameter = { bg = c.bg_visual, bold = true }, -- parameter highlighter in signature help
    LspCodeLens = { fg = c.comment },
    LspInlayHint = { bg = c.base11, fg = c.dark3 },

    LspInfoBorder = { fg = c.border_highlight, bg = c.bg_float },
  }

  return theme
end

return M
