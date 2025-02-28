local M = {}

-- Defines the highlight group colors for diagnostic.
--- @param c table: The available colors.
--- @param o FlowConfig: The available options.
--- @return table: Diagnostic highlights.
function M.get(c, o)
  local background_tone = "very_dark"
  if not o.theme.style == "dark" then
    background_tone = "very_light"
  end
  local theme = {
    DiagnosticError = { fg = c.error },
    DiagnosticWarn = { fg = c.warning },
    DiagnosticInfo = { fg = c.info },
    DiagnosticHint = { fg = c.hint },
    DiagnosticUnnecessary = { undercurl = false },

    DiagnosticVirtualTextError = { fg = c.error, bg = c.Red[background_tone] },
    DiagnosticVirtualTextWarn = { fg = c.warning, bg = c.Yellow[background_tone] },
    DiagnosticVirtualTextInfo = { fg = c.info, bg = c.Cyan[background_tone] },
    DiagnosticVirtualTextHint = { fg = c.hint, bg = c.Light_blue[background_tone] },

    DiagnosticFloatingError = { link = "DiagnostictError" },
    DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
    DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
    DiagnosticFloatingHint = { link = "DiagnosticHint" },
    DiagnosticFloatingOk = { fg = c.fg_viusual },

    DiagnosticUnderlineError = { undercurl = false, sp = c.error },
    DiagnosticUnderlineWarn = { undercurl = false, sp = c.warning },
    DiagnosticUnderlineInfo = { undercurl = false, sp = c.info },
    DiagnosticUnderlineHint = { undercurl = false, sp = c.hint },
  }

  return theme
end

return M
