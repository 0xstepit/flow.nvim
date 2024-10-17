local M = {}

-- Defines the highlight group colors for
-- the debug adapter
-- @param c The available colors.
function M.get(c, options)
  local theme = {
    debugPC = { bg = c.bg_sidebar }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { fg = c.error }, -- used for breakpoint colors in terminal-debug
    DapBreakpoint = { link = "debugBreakpoint" },

    -- Debug = { fg = c.orange }, -- debugging statements
    -- DapUIFloatBorder = { fg = c.green, bg = c.bg },
    --
    -- -- Icons
    DapUIStop = { fg = c.red },
    DapUIRestart = { fg = c.green },
    DapUIPlayPause = { link = "DapUIRestart" },

    DapUIStepInto = { fg = c.light_blue },
    DapUIStepOver = { link = "DapUIStepInto" },
    DapUIStepOut = { link = "DapUIStepInto" },
    DapUIStepBack = { link = "DapUIStepInto" },
    --
    DapUILineNumber = { fg = c.sky_blue },
    DapUICurrentFrameName = { fg = c.yellow },

    DapUIWatchesValue = { fg = c.grey[5] },
    DapUIWatchesError = { fg = c.error },

    -- DapUIWatchesEmpty = { link = "DapUIWatchesValue" },
    --
    -- -- Text
    DapUIThread = { fg = c.cyan },
    DapUIStoppedThread = { fg = c.light_blue },
    -- DapUIFrameName = { fg = c.green },
    --
    DapUIScope = { link = "DapUIStoppedThread" }, -- Text like Locals

    DapUIVariable = { fg = c.blue },
    -- DapUIValue = { fg = c.cyan },

    DapUIType = { fg = c.purple },
    DapUISource = { fg = c.purple }, -- filename

    DapUIBreakpointsPath = { fg = c.red },
    DapUIBreakpointsLine = { fg = c.red },
    --
    DapUIDecoration = { fg = c.grey[5] }, -- arrow indicating vars
    DapUIModifiedValue = { fg = c.yellow }, -- value of the last modified variables in the scope.
  }

  return theme
end

return M
