local M = {}

-- Defines the highlight group colors for completion.
--- @param c table: The available colors.
--- @return table: Nvim cmp highlights.
function M.get(c, _)
  local theme = {
    CmpItemMenu = { fg = c.comment },
    CmpItemAbbr = { fg = c.grey[5] },
    CmpItemAbbrMatch = { fg = c.cyan },
    CmpItemAbbrMatchFuzzy = { fg = c.cyan },
    CmpItemAbbrDeprecated = { fg = c.fg_gutter, bg = c.none, strikethrough = true },
    -- CmpCompletionSel = { fg = c.fg_visual },

    -- Kind
    -- CmpItemKindDefault = { fg = c.fg_visual },
    CmpItemKindKeyword = { link = "Keyword" },
    CmpItemKindFunction = { link = "Function" },
    CmpItemKindSnippet = { fg = c.red },
    CmpItemKindField = { link = "@field" },
    CmpItemKindProperty = { fg = c.sky_blue },
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
    CmpItemKindVariable = { fg = c.sky_blue },
    CmpItemKindUnit = { link = "Constant" },
    CmpItemKindFile = { link = "Directory" },
    CmpItemKindFolder = { link = "Directory" },
    CmpItemKindMethod = { link = "Function" },
    CmpItemKindValue = { link = "Constant" },
    CmpItemKindEnumMember = { link = "Type" },
    CmpItemKindInterface = { link = "Type" },
    CmpItemKindColor = { link = "Constant" },
    CmpItemKindTypeParameter = { link = "Type" },
  }

  return theme
end

return M
