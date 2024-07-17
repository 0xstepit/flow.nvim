local base = require("flow.highlights.base")
local colors = require("flow.colors")
local completion = require("flow.highlights.completion")
local dap = require("flow.highlights.dap")
local git = require("flow.highlights.git")
local lazy = require("flow.highlights.lazy")
local lsp = require("flow.highlights.lsp")
local markdown = require("flow.highlights.markdown")
local syntax = require("flow.highlights.syntax")
local telescope = require("flow.highlights.telescope")
local todo = require("flow.highlights.todo-comments")
local treesitter = require("flow.highlights.treesitter")
local util = require("flow.util")
local whichkey = require("flow.highlights.whichkey")

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
  syntax = syntax.get(c)
  lsp = lsp.get(c)
  dap = dap.get(c)
  lazy = lazy.get(c)
  todo = todo.get(c)
  whichkey = whichkey.get(c)
  highlights = util.merge(highlights, base)
  highlights = util.merge(highlights, syntax)
  highlights = util.merge(highlights, whichkey)
  highlights = util.merge(highlights, todo)
  highlights = util.merge(highlights, telescope)
  highlights = util.merge(highlights, git)
  -- highlights = util.merge(highlights, treesitter)
  highlights = util.merge(highlights, completion)
  highlights = util.merge(highlights, markdown)
  highlights = util.merge(highlights, dap)
  highlights = util.merge(highlights, lsp)
  highlights = util.merge(highlights, lazy)
  theme.highlights = highlights

  theme.defer = {}

  util.autocmds(theme.config)

  vim.defer_fn(function()
    util.syntax(theme.defer)
  end, 100)

  return theme.highlights
end

return M
