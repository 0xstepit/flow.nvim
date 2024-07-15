local base = require("flow.groups.base")
local colors = require("flow.colors")
local completion = require("flow.groups.completion")
local git = require("flow.groups.git")
local markdown = require("flow.groups.markdown")
local telescope = require("flow.groups.telescope")
local todo = require("flow.groups.todo-comments")
local treesitter = require("flow.groups.treesitter")
local util = require("flow.util")
local whichkey = require("flow.groups.whichkey")

local M = {}

function M.setup()
  local config = require("flow.config")
  local options = config.options

  local theme = {
    config = options,
    colors = colors.setup(options),
  }

  local c = theme.colors

  local highlights = {}

  base = base.get(c, options)
  git = git.get(c)
  telescope = telescope.get(c)
  treesitter = treesitter.get(c)
  completion = completion.get(c)
  markdown = markdown.get(c)
  todo = todo.get(c)
  whichkey = whichkey.get(c)
  highlights = util.merge(highlights, base)
  highlights = util.merge(highlights, whichkey)
  highlights = util.merge(highlights, todo)
  highlights = util.merge(highlights, telescope)
  highlights = util.merge(highlights, git)
  highlights = util.merge(highlights, treesitter)
  highlights = util.merge(highlights, completion)
  highlights = util.merge(highlights, markdown)
  theme.highlights = highlights

  theme.defer = {}

  util.autocmds(theme.config)

  vim.defer_fn(function()
    util.syntax(theme.defer)
  end, 100)

  return theme.highlights
end

return M
