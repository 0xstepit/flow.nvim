local M = {}

-- Defines the highlight group colors for
-- the lazy plugin manager.
-- @param c The available colors.
function M.get(c, options)
  local theme = {
    LazyProgressDone = { bold = true, fg = c.fluo },
    LazyProgressTodo = { bold = true, fg = c.light_blue },

    LazyButtonActive = { bold = true, bg = c.fluo, fg = c.black },
    LazyButton = { bg = c.bg_highlight, fg = c.grey[7] },
    LazyNormal = { fg = c.light_blue },
    LazyReasonRuntime = { fg = c.grey[4] },

    LazyReasonStart = { fg = c.purple },
    LazyReasonSource = { link = "LazyReasonStart" },
    LazyReasonPlugin = { link = "LazyReasonStart" },
    LazyReasonCmd = { fg = c.teal },
  }

  return theme
end

return M
