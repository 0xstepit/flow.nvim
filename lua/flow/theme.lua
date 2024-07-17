local flow_colors = require("flow.colors")
local util = require("flow.util")

local M = {}

M.active_highlights = {
  "base",
  "completion",
  "dap",
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

function M.setup()
  local config = require("flow.config")
  local options = config.options

  local colors = flow_colors.setup(options)

  local highlights = {}

  for _, h in ipairs(M.active_highlights) do
    local group_path = "flow.highlights." .. h
    local group = require(group_path)
    local hi = group.get(colors, options)
    highlights = util.merge(highlights, hi)
  end

  util.autocmds(options)

  return highlights
end

return M
