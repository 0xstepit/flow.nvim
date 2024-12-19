local M = {}

-- Defines the highlight group colors for
-- the lazy plugin manager.
--- @param c table: The available colors.
--- @return table: Lazy plugin highlights.
function M.get(c, _)
  local theme = {
    LazyH1 = { bg = c.fluo, fg = c.grey[2] },

    LazyProgressDone = { bold = true, fg = c.fluo },
    LazyProgressTodo = { bold = true, fg = c.light_blue },

    LazyNormal = { fg = c.light_blue },
    LazyButton = { bg = c.grey[4], fg = c.grey[2] },
    LazyButtonActive = { bg = c.light_blue, fg = c.grey[2], bold = true },

    LazyReasonStart = { fg = c.purple },
    LazyReasonSource = { link = "LazyReasonStart" },
    LazyReasonPlugin = { link = "LazyReasonStart" },
    LazyReasonRuntime = { fg = c.grey[4] },
    LazyReasonEvent = { fg = c.red },
    LazyReasonCmd = { fg = c.sky_blue },

    LazySpecial = { fg = c.grey[2] },
    LazyDimmed = { fg = c.grey[7] },
  }

  return theme
end

return M
