local M = {}

-- Defines the highlight group colors for completion.
-- @param c The available colors.
function M.get(c, options)
    local theme = {
        -- Documentation
        CmpDocumentation = { fg = c.fg, bg = c.bg_float },
        CmpDocumentationBorder = { bg = c.bg_float },

        CmpItemMenu = { fg = c.comment },
        CmpItemAbbr = { fg = c.grey[5] },
        CmpItemAbbrMatch = { fg = c.cyan },
        CmpItemAbbrMatchFuzzy = { fg = c.cyan },
        CmpItemAbbrDeprecated = { fg = c.fg_gutter, bg = c.none, strikethrough = true },
        CmpCompletionSel = { fg = c.fg_visual },

        -- Kind
        CmpItemKindDefault = { fg = c.fg_visual },
        CmpItemKindKeyword = { link = "Keyword" },
        CmpItemKindFunction = { link = "Function" },
        CmpItemKindSnippet = { fg = c.red },
        CmpItemKindField = { link = "@field" },
        CmpItemKindProperty = { link = "@property" },
        CmpItemKindEvent = { link = "Type" },
        CmpItemKindText = { fg = c.fg_popup },
        CmpItemKindEnum = { link = "Type" },
        CmpItemKindConstant = { link = "Constant" },
        CmpItemKindConstructor = { link = "Function" },
        CmpItemKindReference = { fg = c.cyan },
        CmpItemKindStruct = { link = "Structure" },
        CmpItemKindClass = { link = "Type" },
        CmpItemKindModule = { fg = c.yellow },
        CmpItemKindOperator = { link = "Operator" },
        CmpItemKindVariable = { fg = c.teal },
        CmpItemKindUnit = { link = "Constant" },
        CmpItemKindFile = { link = "Directory" },
        CmpItemKindFolder = { link = "Directory" },
        CmpItemKindMethod = { link = "Function" },
        CmpItemKindValue = { link = "Constant" },
        CmpItemKindEnumMember = { link = "Type" },
        CmpItemKindInterface = { link = "Type" },
        CmpItemKindColor = { link = "Constant" },
        CmpItemKindTypeParameter = { link = "Type" },

        -- AI
        CmpItemKindTabNine = { fg = c.red },
        CmpItemKindCopilot = { fg = c.red },
    }

    return theme
end

return M
