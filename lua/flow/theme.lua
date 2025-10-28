local flow_colors = require("flow.colors")
local util = require("flow.util")

local M = {}

--- List of active highlight groups to be configured.
--- @type string[]
M.active_highlights = {
  "base",
  "blink",
  "syntax",
  "markdown",
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
  "oil",
  "render-markdown",
  "statusline",
  "telescope",
  "todo-comments",
  "treesitter",
  "trouble",
  "whichkey",
  "winbar",
  "undotree",
  "vim-highlighturl",
  "mason",
  "avante",
}

M.b = {}

--- Configure the colorscheme highlights.
--- This function sets up the highlight groups by merging the colors
--- and options for each active highlight group.
--- @return table: A table of configured highlight groups.
function M.configure()
  -- Options retrieved can be the default one or those modified by the call to
  -- `require("flow").config{}`
  local options = require("flow.config").options

  local colors = flow_colors.setup(options)

  local highlights = {}

  for _, h in ipairs(M.active_highlights) do
    local group_path = "flow.highlights." .. h
    local group = require(group_path)
    local hi = group.get(colors, options)
    highlights = util.merge(highlights, hi)
  end

  vim.api.nvim_set_hl(0, "@lsp.type.property.lua", {})

  -- util.autocmds()

  return highlights
end

return M
