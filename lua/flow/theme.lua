local base = require("flow.groups.base")
local colors = require("flow.colors")
local git = require("flow.groups.git")
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
  todo = todo.get(c)
  whichkey = whichkey.get(c)
  highlights = util.merge(highlights, base)
  highlights = util.merge(highlights, whichkey)
  highlights = util.merge(highlights, todo)
  highlights = util.merge(highlights, telescope)
  highlights = util.merge(highlights, git)
  highlights = util.merge(highlights, treesitter)
  theme.highlights = highlights

  -- lsp symbol kind and completion kind highlights
  local kinds = {
    Array = "@punctuation.bracket",
    Boolean = "@boolean",
    Class = "@type",
    Color = "Special",
    Constant = "@constant",
    Constructor = "@constructor",
    Enum = "@lsp.type.enum",
    EnumMember = "@lsp.type.enumMember",
    Event = "Special",
    Field = "@variable.member",
    File = "Normal",
    Folder = "Directory",
    Function = "@function",
    Interface = "@lsp.type.interface",
    Key = "@variable.member",
    Keyword = "@lsp.type.keyword",
    Method = "@function.method",
    Module = "@module",
    Namespace = "@module",
    Null = "@constant.builtin",
    Number = "@number",
    Object = "@constant",
    Operator = "@operator",
    Package = "@module",
    Property = "@property",
    Reference = "@markup.link",
    Snippet = "Conceal",
    String = "@string",
    Struct = "@lsp.type.struct",
    Unit = "@lsp.type.struct",
    Text = "@markup",
    TypeParameter = "@lsp.type.typeParameter",
    Variable = "@variable",
    Value = "@string",
  }

  local kind_groups = { "NavicIcons%s", "Aerial%sIcon", "CmpItemKind%s", "NoiceCompletionItemKind%s" }
  for kind, link in pairs(kinds) do
    local base = "LspKind" .. kind
    theme.highlights[base] = { link = link }
    for _, plugin in pairs(kind_groups) do
      theme.highlights[plugin:format(kind)] = { link = base }
    end
  end

  theme.defer = {}

  util.autocmds(theme.config)

  vim.defer_fn(function()
    util.syntax(theme.defer)
  end, 100)

  return theme.highlights
end

return M
