local M = {}

-- @param c The available colors.
function M.get(c, options)
  local theme = {
    Constant = { fg = c.yellow }, -- Any constant.
    String = { fg = c.blue }, -- A string constant: "this is a string".
    Character = { link = "String" }, -- A character constant: 'c', '\n'.
    Operator = { fg = c.red }, -- "sizeof", "+", "*", etc.
    Number = { link = "Constant" }, -- A number constant: 234, 0xff.
    Boolean = { link = "Constant" }, -- A boolean constant: TRUE, false.
    Float = { link = "Number" }, -- A floating point constant: 2.3e10.

    Type = { fg = c.light_blue }, -- Types like int, long, char, etc.
    Keyword = { fg = c.red }, -- Any other keyword.
    Typedef = { link = "Type" }, -- A typedef.
    Structure = { link = "Type" }, -- A struct, union, enum, etc.
    Identifier = { fg = c.cyan }, -- Any variable name.
    Function = { fg = c.blue }, -- Function name (also: methods for classes).
    Delimiter = { fg = c.purple }, -- Character that needs attention.

    Statement = { fg = c.purple }, -- Any statement.
    Repeat = { link = "Operator" }, -- for, do, while, etc.
    Conditional = { link = "Operator" }, -- if, then, else, endif, switch, etc.
    Label = { link = "Keyword" }, -- case, default, etc.
    Exception = { link = "Keyword" }, -- try, catch, throw.

    Error = { bg = c.bg, fg = c.red.dim }, -- Any erroneous construct.
    Todo = { bg = c.bg, fg = c.teal.dim }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX.
    Warn = { bg = c.bg, fg = c.yellow.dim }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX.
    Note = { bg = c.bg, fg = c.light_blue.dim }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX.

    -- TODO: better investigate
    StorageClass = { fg = c.to_check }, -- Static, register, volatile, etc.
  }

  return theme
end

return M
