local M = {}

-- Defines the highlight group colors for
-- the lazy plugin manager.
-- @param c The available colors.
function M.get(c)
  local theme = {
    LazyProgressDone = { bold = true, fg = c.fluo },
    LazyProgressTodo = { bold = true, fg = c.light_blue },
  }

  return theme
end

return M
