local M = {}

-- Defines the highlight group colors for completion.
-- @param c The available colors.
function M.get(c)
  local theme = {
    -- Documentation
    CmpDocumentation = { fg = c.fg, bg = c.bg_float },
    CmpDocumentationBorder = { bg = c.bg_float },

    CmpItemMenu = { fg = c.comment },

    CmpItemAbbr = { fg = c.grey[7] },
    CmpItemAbbrDeprecated = { fg = c.fg_gutter, bg = c.none, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.cyan },
    CmpItemAbbrMatchFuzzy = { fg = c.cyan },

    -- Kind
    CmpItemKindDefault = { fg = c.fluo },
    CmpItemKindKeyword = { fg = c.fluo },
    CmpItemKindFunction = { link = "Function" },
    CmpItemKindSnippet = { fg = c.light_blue },
    CmpItemKindField = { link = "@field" },
    CmpItemKindProperty = { link = "@property" },
    CmpItemKindEvent = { link = "Type" },
    CmpItemKindText = { fg = c.grey[6] },
    CmpItemKindEnum = { link = "Type" },
    CmpItemKindConstant = { link = "Constant" },
    CmpItemKindConstructor = { link = "Function" },
    CmpItemKindReference = { fg = c.cyan },
    CmpItemKindStruct = { link = "Type" },
    CmpItemKindClass = { link = "Type" },
    CmpItemKindModule = { fg = c.yellow },
    CmpItemKindOperator = { link = "Operator" },
    CmpItemKindVariable = { fg = c.cyan },
    CmpItemKindFile = { fg = c.blue },
    CmpItemKindUnit = { link = "Constant" },
    CmpItemKindFolder = { fg = c.yellow },
    CmpItemKindMethod = { link = "Function" },
    CmpItemKindValue = { link = "Constant" },
    CmpItemKindEnumMember = { link = "Type" },
    CmpItemKindInterface = { link = "Type" },
    CmpItemKindColor = { link = "Constant" },
    CmpItemKindTypeParameter = { link = "Type" },
    CmpItemKindTabNine = { fg = c.red },
    CmpItemKindCopilot = { fg = c.red },
    LspKindSnippet = { fg = c.to_check },
  }

  return theme
end

return M
