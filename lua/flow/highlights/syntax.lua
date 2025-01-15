local M = {}

--- @param c table: The available colors.
--- @param o FlowConfig: The available options.
--- @return table: Syntax highlights.
function M.get(c, o)
  local theme = {

    Boolean = { link = "Constant" }, -- A boolean constant: TRUE, false.
    Character = { link = "String" }, -- A character constant: 'c', '\n'.
    Comment = { fg = c.comment }, -- Any comment.
    Conditional = { link = "Operator" }, -- if, then, else, endif, switch, etc.
    Constant = { fg = c.yellow }, -- Any constant.
    Delimiter = { fg = c.purple }, -- Character that needs attention.
    Error = { bg = c.bg, fg = c.error }, -- Any erroneous construct.
    Exception = { link = "Keyword" }, -- try, catch, throw.
    Float = { link = "Number" }, -- A floating point constant: 2.3e10.
    Function = { fg = c.blue }, -- Function name (also: methods for classes).
    Identifier = { fg = c.cyan }, -- Any variable name.
    Keyword = { fg = c.red }, -- Any other keyword.
    Label = { link = "Keyword" }, -- case, default, etc.
    Macro = { fg = c.grey[6] }, -- Heavily used in rust.
    Number = { link = "Constant" }, -- A number constant: 234, 0xff.
    Operator = { fg = c.red }, -- "sizeof", "+", "*", etc.
    PreCondit = { link = "Operator" }, --  preprocessor #if, #else, #endif, etc. (used in Makefile)
    PreProc = { fg = c.cyan }, -- (preferred) generic Preprocessor
    Repeat = { link = "Operator" }, -- for, do, while, etc.
    Special = { fg = c.purple }, -- Any special symbol, like {} in lua.
    SpecialChar = { fg = c.sky_blue }, --  special character in a constant. Heavily used in markdown.
    SpecialComment = { fg = c.to_check }, -- special things inside a comment
    SpecialKey = { fg = c.fluo }, -- Unprintable characters: text displayed differently from what it really is. Like pressing Ctrl + k in insert mode.
    Statement = { fg = c.purple }, -- Any statement.
    StorageClass = { fg = c.to_check }, -- Static, register, volatile, etc.
    String = { fg = c.sky_blue }, -- A string constant: "this is a string".
    Structure = { link = "Type" }, -- A struct, union, enum, etc.
    Tag = { fg = c.fg_visual }, -- You can use CTRL-] on this. Like Help tag in fugitive.
    Type = { fg = c.light_blue }, -- Types like int, long, char, etc.
    Typedef = { link = "Type" }, -- A typedef.
    Bold = { fg = c.grey[6], bold = true },

    -- Git
    Added = { bg = c.diff.add }, -- Added line in a diff.
    Removed = { bg = c.diff.delete }, -- Removed line in a diff.
    Changed = { bg = c.diff.change }, -- Changed line in a diff.

    -- Todo
    Todo = { fg = c.todo, bg = c.comment },
    Fixme = { fg = c.fixme, bg = c.comment },
    Note = { fg = c.note, bg = c.comment },
    Hack = { fg = c.hack, bg = c.comment },
    Warn = { fg = c.warning, bg = c.comment }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX.
  }

  -- Special comments
  if o.ui.aggressive_special_comment then
    theme.Todo = { bg = c.todo, fg = c.comment }
    theme.Fixme = { bg = c.fixme, fg = c.comment }
    theme.Note = { bg = c.note, fg = c.comment }
    theme.Hack = { bg = c.hack, fg = c.comment }
  else
    theme.Todo = { fg = c.todo, bg = c.comment }
    theme.Fixme = { fg = c.fixme, bg = c.comment }
    theme.Note = { fg = c.note, bg = c.comment }
    theme.Hack = { fg = c.hack, bg = c.comment }
  end

  return theme
end

return M
