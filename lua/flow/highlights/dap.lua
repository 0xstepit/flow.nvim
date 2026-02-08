local M = {}

-- Defines the highlight group colors for
-- the debug adapter
--- @param c table: The available colors.
--- @return table: Debug highlights.
function M.get(c, _)
  local theme = {
    debugPC = { bg = c.grey[2] }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { link = "FlowError" }, -- used for breakpoint colors in terminal-debug
    DapBreakpoint = { link = "debugBreakpoint" },

    -- Debug = { fg = c.orange }, -- debugging statements
    -- DapUIFloatBorder = { fg = c.green, bg = c.bg },
    --
    -- -- Icons
    DapUIStop = { link = "FlowError" },
    DapUIRestart = { link = "FlowSuccess" },
    DapUIPlayPause = { link = "DapUIRestart" },

    DapUIStepInto = { link = "FlowInfo" },
    DapUIStepOver = { link = "DapUIStepInto" },
    DapUIStepOut = { link = "DapUIStepInto" },
    DapUIStepBack = { link = "DapUIStepInto" },
    --
    DapUILineNumber = { fg = c.sky_blue },
    DapUICurrentFrameName = { fg = c.yellow },

    DapUIWatchesValue = { fg = c.grey[8] },
    DapUIWatchesError = { link = "FlowError" },

    -- DapUIWatchesEmpty = { link = "DapUIWatchesValue" },
    --
    -- -- Text
    DapUIThread = { fg = c.cyan },
    DapUIStoppedThread = { fg = c.light_blue },
    -- DapUIFrameName = { fg = c.green },
    --
    DapUIScope = { link = "DapUIStoppedThread" }, -- Text like Locals

    DapUIVariable = { link = "FlowKindVariable" },
    -- DapUIValue = { fg = c.cyan },

    DapUIType = { link = "FlowKindType" },
    DapUISource = { fg = c.purple }, -- filename

    DapUIBreakpointsPath = { link = "FlowError" },
    DapUIBreakpointsLine = { link = "FlowError" },
    --
    DapUIDecoration = { fg = c.grey[8] }, -- arrow indicating vars
    DapUIModifiedValue = { fg = c.yellow }, -- value of the last modified variables in the scope.
  }

  return theme
end

return M
