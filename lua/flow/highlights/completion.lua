local M = {}

-- Defines the highlight group colors for completion.
--- @param c table: The available colors.
--- @return table: Nvim cmp highlights.
function M.get(c, _)
  local theme = {
    CmpItemMenu = { fg = c.comment },
    CmpItemAbbr = { fg = c.grey[7] },
    CmpItemAbbrMatch = { fg = c.cyan },
    CmpItemAbbrMatchFuzzy = { fg = c.cyan },
    CmpItemAbbrDeprecated = { fg = c.fg_gutter, bg = c.none, strikethrough = true },
    -- CmpCompletionSel = { fg = c.fg_visual },

    -- Kind
    -- CmpItemKindDefault = { fg = c.fg_visual },
    CmpItemKindKeyword = { link = "FlowKindKeyword" },
    CmpItemKindFunction = { link = "FlowKindFunction" },
    CmpItemKindSnippet = { fg = c.red },
    CmpItemKindField = { link = "FlowKindField" },
    CmpItemKindProperty = { link = "FlowKindProperty" },
    CmpItemKindEvent = { link = "FlowKindEvent" },
    CmpItemKindText = { link = "FlowKindText" },
    CmpItemKindEnum = { link = "FlowKindEnum" },
    CmpItemKindConstant = { link = "FlowKindConstant" },
    CmpItemKindConstructor = { link = "FlowKindConstructor" },
    CmpItemKindReference = { link = "FlowKindReference" },
    CmpItemKindStruct = { link = "FlowKindStruct" },
    CmpItemKindClass = { link = "FlowKindClass" },
    CmpItemKindModule = { link = "FlowKindModule" },
    CmpItemKindOperator = { link = "FlowKindOperator" },
    CmpItemKindVariable = { link = "FlowKindVariable" },
    CmpItemKindUnit = { link = "FlowKindUnit" },
    CmpItemKindFile = { link = "Directory" },
    CmpItemKindFolder = { link = "Directory" },
    CmpItemKindMethod = { link = "FlowKindMethod" },
    CmpItemKindValue = { link = "FlowKindValue" },
    CmpItemKindEnumMember = { link = "FlowKindEnumMember" },
    CmpItemKindInterface = { link = "FlowKindInterface" },
    CmpItemKindColor = { link = "FlowKindColor" },
    CmpItemKindTypeParameter = { link = "FlowKindTypeParameter" },
  }

  return theme
end

return M
