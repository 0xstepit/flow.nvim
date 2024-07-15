local M = {}

-- Defines the highlight group colors for
-- the debug adapter
-- @param c The available colors.
function M.get(c)
  local theme = {
    debugPC = { bg = c.bg_sidebar }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { fg = c.info }, -- used for breakpoint colors in terminal-debug

    DapBreakpoint = { link = "debugBreakpoint" },
  }

  return theme
end

return M
