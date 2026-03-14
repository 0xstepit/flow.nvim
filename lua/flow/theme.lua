local colors = require("flow.colors")
local util = require("flow.util")

local M = {
  --- List of active pulugins highlight groups to be configured.
  --- @type string[]
  active_highlights = {
    "avante",
    "base",
    "blink",
    "completion",
    "dap",
    "diagnostic",
    "flash",
    "fzf-lua",
    "git",
    "ibl",
    "lazy",
    "lsp",
    "mini-hipatterns",
    "mini-files",
    "markdown",
    "mason",
    "oil",
    "render-markdown",
    "statusline",
    "syntax",
    "telescope",
    "todo-comments",
    "treesitter",
    "trouble",
    "whichkey",
    "winbar",
    "undotree",
    "vim-highlighturl",
  },
}

--- Sets the highlight groups up by merging the colors
--- and options for each active highlight group.
--- @return table Highlight groups.
--- @return table Flow colors.
function M.configure()
  -- Options retrieved can be the default one or those modified by the call to
  -- `require("flow").setup{}`
  local options = require("flow.config").options

  local flow_colors = colors.setup(options)

  local highlights = {}

  for _, h in ipairs(M.active_highlights) do
    local group_path = "flow.highlights." .. h
    local group = require(group_path)
    local hi = group.get(flow_colors, options)
    highlights = util.merge(highlights, hi)
  end

  return highlights, flow_colors
end

return M
