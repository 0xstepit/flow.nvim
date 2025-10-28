local M = {}

--- @param c table: The available colors.
--- @return table: Statusline highlights.
function M.get(c, _)
  local theme = {
    Statusline = { fg = c.fg_statusline, bg = c.bg_statusline },
    StatuslineMode = { bg = c.blue, fg = c.bg_highlight },
    StatuslineGitBranch = { fg = c.light_blue, bg = c.bg_highlight },
    StatuslineFiletype = { bg = c.bg_statusline, fg = c.fg_statusline },
    -- WinBarFile = { fg = c.cyan },
    -- WinBarPath = { fg = c.comment },
  }

  return theme
end

return M
