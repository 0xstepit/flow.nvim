local M = {}

-- @param c The available colors.
function M.get(c, _)
  local theme = {
    Added = { bg = c.diff.add }, -- Added line in a diff.
    Boolean = { link = "Constant" }, -- A boolean constant: TRUE, false.
    Changed = { bg = c.diff.change }, -- Changed line in a diff.
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
    Macro = { fg = c.grey[5] }, -- Heavily used in rust.
    Note = { bg = c.bg, fg = c.light_blue }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX.
    Number = { link = "Constant" }, -- A number constant: 234, 0xff.
    Operator = { fg = c.red }, -- "sizeof", "+", "*", etc.
    PreCondit = { fg = c.to_check }, --  preprocessor #if, #else, #endif, etc.
    PreProc = { fg = c.cyan }, -- (preferred) generic Preprocessor
    Removed = { bg = c.diff.delete }, -- Removed line in a diff.
    Repeat = { link = "Operator" }, -- for, do, while, etc.
    Special = { fg = c.purple }, -- Any special symbol, like {} in lua.
    SpecialChar = { fg = c.teal }, --  special character in a constant. Heavily used in markdown.
    SpecialComment = { fg = c.to_check }, -- special things inside a comment
    SpecialKey = { fg = c.fluo }, -- Unprintable characters: text displayed differently from what it really is. Like pressing Ctrl + k in insert mode.
    Statement = { fg = c.purple }, -- Any statement.
    StorageClass = { fg = c.to_check }, -- Static, register, volatile, etc.
    String = { fg = c.cyan }, -- A string constant: "this is a string".
    Structure = { link = "Type" }, -- A struct, union, enum, etc.
    Tag = { fg = c.fg_visual }, -- You can use CTRL-] on this. Like Help tag in fugitive.
    Todo = { bg = c.bg, fg = c.todo }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX.
    Type = { fg = c.light_blue }, -- Types like int, long, char, etc.
    Typedef = { link = "Type" }, -- A typedef.
    Warn = { bg = c.bg, fg = c.warning }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX.
  }

  return theme
end

return M
