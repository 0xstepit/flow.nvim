local M = {}

-- Defines the highlight group colors for
-- the language server protocols.
--- @param c table: The available colors.
--- @return table: Nvim lsp highlights.
function M.get(c, _)
  local theme = {
    LspSignatureActiveParameter = { fg = c.grey[2], bg = c.fg_visual, bold = true }, -- Parameter highlighter in signature help.

    LspReferenceText = { bg = c.Cyan.very_dark }, -- Used for highlighting "text" references.
    LspReferenceRead = { link = "LspReferenceText" }, -- Used for highlighting "read" references.
    LspReferenceWrite = { link = "LspReferenceText" }, -- Used for highlighting "write" references.

    LspCodeLens = { fg = c.comment },

    LspInlayHint = { fg = c.grey[6] },

    LspInfoBorder = { fg = c.fg_border, bg = c.bg_float },
    LspKindSnippet = { fg = c.to_check },
  }

  return theme
end

return M
