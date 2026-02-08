local M = {}

-- Defines the highlight group colors for
-- the lazy plugin manager.
--- @param c table: The available colors.
--- @return table: Lazy plugin highlights.
function M.get(c, _)
  local theme = {
    LazyH1 = { link = "FlowHeader" },

    LazyProgressDone = { bold = true, fg = c.purple },
    LazyProgressTodo = { bold = true, fg = c.cyan },

    LazyNormal = { fg = c.light_blue },
    LazyButton = { link = "FlowButton" },
    LazyButtonActive = { link = "FlowButtonActive" },

    LazyReasonStart = { fg = c.purple },
    LazyReasonSource = { link = "LazyReasonStart" },
    LazyReasonPlugin = { link = "LazyReasonStart" },
    LazyReasonRuntime = { fg = c.grey[7] },
    LazyReasonEvent = { fg = c.red },
    LazyReasonCmd = { fg = c.sky_blue },

    LazySpecial = { fg = c.grey[3] },
    LazyDimmed = { fg = c.grey[10] },
  }

  return theme
end

return M
