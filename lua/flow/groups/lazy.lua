local M = {}

-- Defines the highlight group colors for
-- the lazy plugin manager.
-- @param c The available colors.
function M.get(c)
  local theme = {
    LazyProgressDone = { bold = true, fg = c.magenta1 },
    LazyProgressTodo = { bold = true, fg = c.fg_gutter },
  }

  return theme
end

return M
