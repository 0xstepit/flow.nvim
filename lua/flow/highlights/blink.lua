local M = {}

-- Defines the highlight group colors for Blink completion.
--- @param c table: The available colors.
--- @return table: Nvim cmp highlights.
function M.get(c, _)
  local ret = {
    BlinkCmpDoc = { fg = c.fg, bg = c.bg_float },
    BlinkCmpGhostText = { fg = c.red },
    BlinkCmpKindCodeium = { fg = c.to_check },
    BlinkCmpKindCopilot = { fg = c.to_check },
    BlinkCmpKindSupermaven = { fg = c.t_check },
    BlinkCmpKindTabNine = { fg = c.to_check },
    BlinkCmpSignatureHelp = { fg = c.fg, bg = c.bg_float },

    BlinkCmpLabelDeprecated = { fg = c.red, strikethrough = true },
    BlinkCmpLabelMatch = { fg = c.blue, bold = true },

    BlinkCmpScrollBarGutter = { fg = c.to_check, bg = c.red },

    BlinkCmpMenuBorder = { link = "FloatBorder" },
    BlinkCmpDocBorder = { link = "BlinkCmpMenuBorder" },
    BlinkCmpSignatureHelpBorder = { link = "BlinkCmpMenuBorder" },

    BlinkCmpLabel = { fg = c.fg },

    -- Kind
    BlinkCmpKindDefault = { fg = c.fg_visual },
    BlinkCmpKindKeyword = { link = "FlowKindKeyword" },
    BlinkCmpKindFunction = { link = "FlowKindFunction" },
    BlinkCmpKindSnippet = { fg = c.light_blue },
    BlinkCmpKindField = { link = "FlowKindField" },
    BlinkCmpKindProperty = { link = "FlowKindProperty" },
    BlinkCmpKindEvent = { link = "FlowKindEvent" },
    BlinkCmpKindText = { link = "FlowKindText" },
    BlinkCmpKindEnum = { link = "FlowKindEnum" },
    BlinkCmpKindConstant = { link = "FlowKindConstant" },
    BlinkCmpKindConstructor = { link = "FlowKindConstructor" },
    BlinkCmpKindReference = { link = "FlowKindReference" },
    BlinkCmpKindStruct = { link = "FlowKindStruct" },
    BlinkCmpKindClass = { link = "FlowKindClass" },
    BlinkCmpKindModule = { link = "FlowKindModule" },
    BlinkCmpKindOperator = { link = "FlowKindOperator" },
    BlinkCmpKindVariable = { link = "FlowKindVariable" },
    BlinkCmpKindUnit = { link = "FlowKindUnit" },
    BlinkCmpKindFile = { link = "Directory" },
    BlinkCmpKindFolder = { link = "Directory" },
    BlinkCmpKindMethod = { link = "FlowKindMethod" },
    BlinkCmpKindValue = { link = "FlowKindValue" },
    BlinkCmpKindEnumMember = { link = "FlowKindEnumMember" },
    BlinkCmpKindInterface = { link = "FlowKindInterface" },
    BlinkCmpKindColor = { link = "FlowKindColor" },
    BlinkCmpKindTypeParameter = { link = "FlowKindTypeParameter" },
  }

  -- require("tokyonight.groups.kinds").kinds(ret, "BlinkCmpKind%s")
  return ret
end

return M
