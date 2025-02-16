local M = {}

-- Defines the highlight group colors for
-- the lazy plugin manager.
--- @param c table: The available colors.
--- @return table: Lazy plugin highlights.
function M.get(c, _)
  local theme = {
    LazyH1 = { bg = c.fluo, fg = c.grey[3] },

    LazyProgressDone = { bold = true, fg = c.purple },
    LazyProgressTodo = { bold = true, fg = c.cyan },

    LazyNormal = { fg = c.light_blue },
    LazyButton = { bg = c.grey[5], fg = c.grey[3] },
    LazyButtonActive = { bg = c.light_blue, fg = c.grey[3], bold = true },

    LazyReasonStart = { fg = c.purple },
    LazyReasonSource = { link = "LazyReasonStart" },
    LazyReasonPlugin = { link = "LazyReasonStart" },
    LazyReasonRuntime = { fg = c.grey[5] },
    LazyReasonEvent = { fg = c.red },
    LazyReasonCmd = { fg = c.sky_blue },

    LazySpecial = { fg = c.grey[3] },
    LazyDimmed = { fg = c.grey[8] },
  }

  return theme
end

return M
