local M = {}

-- Defines the highlight group colors for
-- the lazy plugin manager.
-- @param c The available colors.
function M.get(c, _)
  local theme = {
    LazyH1 = { bg = c.fluo, fg = c.grey[2] },

    LazyProgressDone = { bold = true, fg = c.fluo },
    LazyProgressTodo = { bold = true, fg = c.light_blue },

    LazyButton = { bg = c.bg_highlight, fg = c.grey[7] },
    LazyNormal = { fg = c.light_blue },
    LazyButtonActive = { bold = true, bg = c.fluo, fg = c.black },

    LazyReasonStart = { fg = c.purple },
    LazyReasonSource = { link = "LazyReasonStart" },
    LazyReasonPlugin = { link = "LazyReasonStart" },
    LazyReasonRuntime = { fg = c.grey[4] },
    LazyReasonEvent = { fg = c.red },
    LazyReasonCmd = { fg = c.sky_blue },

    LazySpecial = { fg = c.yellow },
    LazyDimmed = { fg = c.grey[7] },
  }

  return theme
end

return M
