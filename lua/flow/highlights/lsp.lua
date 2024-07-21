local M = {}

-- Defines the highlight group colors for
-- the language server protocols.
-- @param c The available colors.
function M.get(c, options)
    local theme = {
        LspSignatureActiveParameter = { fg = c.fg_visual, bold = true }, -- Parameter highlighter in signature help.

        LspReferenceText = { bg = c.fg_gutter }, -- Used for highlighting "text" references.
        LspReferenceRead = { bg = c.fg_gutter }, -- Used for highlighting "read" references.
        LspReferenceWrite = { bg = c.fg_gutter }, -- Used for highlighting "write" references.

        LspCodeLens = { fg = c.comment },

        LspInlayHint = { fg = c.grey[5] },

        LspInfoBorder = { fg = c.brder_highlight, bg = c.bg_float },
        LspKindSnippet = { fg = c.to_check },
    }

    return theme
end

return M
