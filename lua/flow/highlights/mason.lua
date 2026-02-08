local M = {}

--- @return table: Mason plugin highlights.
function M.get(_, _)
  local theme = {
    MasonHeader = { link = "FlowHeader" },
    MasonHeading = { link = "Bold" },
    MasonMutedBlock = { link = "FlowButton" },
    MasonHighlightBlockBold = { link = "FlowHighlightBlock" },
  }

  return theme
end

return M
