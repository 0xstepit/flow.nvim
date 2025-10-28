local M = {}

-- Defines the highlight group colors for
-- the language server protocols.
--- @param c table: The available colors.
--- @param o FlowConfig: The available options.
--- @return table: Nvim lsp highlights.
function M.get(c, o)
  local is_dark = o.theme.style == "dark"

  local theme = {

    LspSignatureActiveParameter = {
      bg = (is_dark and c.Cyan.very_dark) or c.Cyan.very_light,
      bold = true,
    }, -- Parameter highlighter in signature help.

    LspReferenceText = { bg = (is_dark and c.Cyan.very_dark) or c.Cyan.very_light }, -- Used for highlighting "text" references.

    LspReferenceRead = { link = "LspReferenceText" }, -- Used for highlighting "read" references.
    LspReferenceWrite = { link = "LspReferenceText" }, -- Used for highlighting "write" references.

    LspCodeLens = { fg = c.comment },

    LspInlayHint = { fg = c.grey[5] },

    LspInfoBorder = { fg = c.fg_border, bg = c.bg_float },
    LspKindSnippet = { fg = c.to_check },

    SnippetTabstop = {
      -- bg = (is_dark and c.Blue.very_light) or c.Blue.very_dark,
      bg = c.comment,
    },
  }

  return theme
end

return M
