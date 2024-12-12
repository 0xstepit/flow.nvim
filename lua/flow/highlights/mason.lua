local M = {}

function M.get(c, _)
  local theme = {
    MasonHeader = { bg = c.fluo, fg = c.grey[2] },
    MasonHeading = { link = "Bold" },
    MasonMutedBlock = { bg = c.grey[4], fg = c.grey[2] },
    MasonHighlightBlockBold = { bg = c.light_blue, fg = c.grey[2], bold = true },
  }

  return theme
end

return M
