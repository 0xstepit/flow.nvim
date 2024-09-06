local M = {}

-- Defines the highlight group colors for
-- the debug adapter
-- @param c The available colors.
function M.get(c, options)
  local theme = {
    debugPC = { bg = c.bg_sidebar }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { fg = c.error }, -- used for breakpoint colors in terminal-debug
    DapBreakpoint = { link = "debugBreakpoint" },

    Debug = { fg = c.orange }, --    debugging statements
    DapUIFloatBorder = { fg = c.green, bg = c.bg },

    -- Icons
    DapUIStop = { fg = c.grey[7], bold = true },
    DapUIPlayPause = { link = "DapUIStop" },
    DapUIStepInto = { link = "DapUIStop" },
    DapUIStepOver = { link = "DapUIStop" },
    DapUIStepOut = { link = "DapUIStop" },
    DapUIStepBack = { link = "DapUIStop" },
    DapUIRestart = { link = "DapUIStop" },

    DapUIType = { fg = c.blue }, -- filename, types, ... in Locals
    DapUILineNumber = { fg = c.purple },
    DapUICurrentFrameName = { fg = c.light_blue },
    DapUIWatchesValue = { fg = c.grey[4] },
    DapUIWatchesEmpty = { link = "DapUIWatchesValue" },
    DapUIThread = { fg = c.grey[5] },
    DapUIStoppedThread = { fg = c.yellow },
    DapUIScope = { fg = c.light_blue },
    DapUIBreakpointsPath = { fg = c.light_blue },
    DapUIValue = { fg = c.cyan },

    DapUIFrameName = { fg = c.grey[5] },
    DapUISource = { fg = c.grey[4] },

    DapUIDecoration = { fg = c.grey[5] },
    DapUIModifiedValue = { fg = c.teal },
  }

  return theme
end

return M
