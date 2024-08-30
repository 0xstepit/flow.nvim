local flow_colors = require("flow.colors")
local util = require("flow.util")

local M = {}

--- List of active highlight groups to be configured.
-- @type string[]
M.active_highlights = {
  "base",
  "completion",
  "dap",
  "diagnostic",
  "git",
  "lazy",
  "lsp",
  "markdown",
  "syntax",
  "telescope",
  "todo-comments",
  "treesitter",
  "trouble",
  "whichkey",
}

M.b = {}
---
--- Configure the colorscheme highlights.
--- This function sets up the highlight groups by merging the colors
--- and options for each active highlight group.
--- @return table A table of configured highlight groups.
function M.configure()
  local options = require("flow.config").options

  local colors = flow_colors.setup(options)

  local highlights = {}

  for _, h in ipairs(M.active_highlights) do
    local group_path = "flow.highlights." .. h
    local group = require(group_path)
    local hi = group.get(colors, options)
    highlights = util.merge(highlights, hi)
  end

  util.autocmds()

  return highlights
end

return M
