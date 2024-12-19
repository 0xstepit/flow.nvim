local M = {}

-- Defines the highlight group colors for diagnostic.
--- @param c table: The available colors.
--- @return table: Diagnostic highlights.
function M.get(c, opts)
  local background_tone = "very_dark"
  if not opts.dark_theme then
    background_tone = "very_bright"
  end
  local theme = {
    DiagnosticError = { fg = c.error },
    DiagnosticWarn = { fg = c.warning },
    DiagnosticInfo = { fg = c.info },
    DiagnosticHint = { fg = c.hint },
    DiagnosticUnnecessary = { fg = c.comment, undercurl = true },

    DiagnosticVirtualTextError = { fg = c.error, bg = c.Red[background_tone] },
    DiagnosticVirtualTextWarn = { fg = c.warning, bg = c.Yellow[background_tone] },
    DiagnosticVirtualTextInfo = { fg = c.info, bg = c.Cyan[background_tone] },
    DiagnosticVirtualTextHint = { fg = c.hint, bg = c.Light_blue[background_tone] },

    DiagnosticFloatingError = { link = "DiagnostictError" },
    DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
    DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
    DiagnosticFloatingHint = { link = "DiagnosticHint" },
    DiagnosticFloatingOk = { fg = c.fg_viusual },

    DiagnosticUnderlineError = { undercurl = true, sp = c.error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning },
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.info },
    DiagnosticUnderlineHint = { undercurl = true, sp = c.hint },
  }

  return theme
end

return M
