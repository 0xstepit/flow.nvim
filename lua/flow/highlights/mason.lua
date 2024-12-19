local M = {}

--- @param c table: The available colors.
--- @return table: Mason plugin highlights.
function M.get(c, _)
  local theme = {
    MasonHeader = { bg = c.fluo, fg = c.grey[3] },
    MasonHeading = { link = "Bold" },
    MasonMutedBlock = { bg = c.grey[5], fg = c.grey[3] },
    MasonHighlightBlockBold = { bg = c.light_blue, fg = c.grey[3], bold = true },
  }

  return theme
end

return M
