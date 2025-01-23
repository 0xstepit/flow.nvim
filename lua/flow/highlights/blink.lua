local M = {}

-- Defines the highlight group colors for Blink completion.
--- @param c table: The available colors.
--- @param o FlowConfig: The available options.
--- @return table: Nvim cmp highlights.
function M.get(c, o)
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

    BlinkCmpMenuBorder = { fg = c.fg_border, bg = c.bg_float },
    BlinkCmpDocBorder = { link = "BlinkCmpMenuBorder" },
    BlinkCmpSignatureHelpBorder = { link = "BlinkCmpMenuBorder" },

    BlinkCmpLabel = { fg = c.fg },

    -- Kind
    BlinkCmpKindDefault = { fg = c.fg_visual },
    BlinkCmpKindKeyword = { link = "Keyword" },
    BlinkCmpKindFunction = { link = "Function" },
    BlinkCmpKindSnippet = { fg = c.light_blue },
    BlinkCmpKindField = { link = "@field" },
    BlinkCmpKindProperty = { fg = c.sky_blue },
    BlinkCmpKindEvent = { link = "Type" },
    BlinkCmpKindText = { fg = c.fg_popup },
    BlinkCmpKindEnum = { link = "Type" },
    BlinkCmpKindConstant = { link = "Constant" },
    BlinkCmpKindConstructor = { link = "Function" },
    BlinkCmpKindReference = { fg = c.cyan },
    BlinkCmpKindStruct = { link = "Structure" },
    BlinkCmpKindClass = { link = "Type" },
    BlinkCmpKindModule = { fg = c.yellow },
    BlinkCmpKindOperator = { link = "Operator" },
    BlinkCmpKindVariable = { fg = c.sky_blue },
    BlinkCmpKindUnit = { link = "Constant" },
    BlinkCmpKindFile = { link = "Directory" },
    BlinkCmpKindFolder = { link = "Directory" },
    BlinkCmpKindMethod = { link = "Function" },
    BlinkCmpKindValue = { link = "Constant" },
    BlinkCmpKindEnumMember = { link = "Type" },
    BlinkCmpKindInterface = { link = "Type" },
    BlinkCmpKindColor = { link = "Constant" },
    BlinkCmpKindTypeParameter = { link = "Type" },
  }

  -- require("tokyonight.groups.kinds").kinds(ret, "BlinkCmpKind%s")
  return ret
end

return M
