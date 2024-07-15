local M = {}

-- Defines the highlight for base color groups.
-- @param c The available colors.
function M.get(c, options)
  local theme = {

    Normal = { fg = c.fg, bg = options.transparent and c.none or c.bg }, -- normal text
    NormalNC = { fg = c.fg, bg = options.transparent and c.none or c.bg }, -- normal text in non-current windows
    NormalSB = { fg = c.fg_sidebar, bg = options.transparent and c.none or c.bg_sidebar }, -- normal text in sidebar
    NormalFloat = { fg = c.fg_float, bg = options.transparent and c.none or c.bg_float }, -- normal text in floating windows like documentation

    NonText = { fg = c.grey[6] }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Whitespace = { fg = c.fg_gutter }, -- "nbsp", "space", "tab" and "trail" in 'listchars'

    Comment = { fg = c.comment }, -- any comment

    -- Lines and columns
    ColorColumn = { bg = c.bg_highlight }, -- used for the columns set with 'colorcolumn'
    CursorColumn = { bg = c.bg_highlight }, -- used with the column set with 'cursorcolumn'
    CursorLine = { bg = c.bg_highlight }, -- used with the line set with 'cursorline'
    LineNr = { fg = c.fg_gutter }, -- line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set
    CursorLineNr = { fg = c.bg_visual }, -- like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line
    -- below are superseeded by Lualine.
    StatusLine = { fg = c.fg_statusline, bg = c.bg_statusline }, -- status line of current window
    StatusLineNC = { fg = c.fg_statusline, bg = c.bg_statusline }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

    Directory = { fg = c.blue }, -- directory names

    EndOfBuffer = { fg = c.fg_highlight }, -- filler lines (~) after the end of the buffer

    VertSplit = { fg = c.border, bold = true }, -- the column separating vertically split windows
    WinSeparator = { link = "VertSplit" }, -- the column separating vertically split windows
    -- the horizontal split does not exists and the status line is used

    Folded = { fg = c.grey[5] }, -- line used for closed folds

    FoldColumn = { bg = options.transparent and c.none or c.bg_gutter, fg = c.fg_gutter }, -- 'foldcolumn'
    SignColumn = { bg = options.transparent and c.none or c.bg_gutter, fg = c.fg_gutter }, -- column where |signs| are displayed
    -- TODO: is this needed?
    SignColumnSB = { link = "SignColumn" }, -- column where |signs| are displayed

    IncSearch = { bg = c.bg_visual, fg = c.fg_visual }, -- 'incsearch' highlighting
    Search = { bg = c.fg_visual, fg = c.bg_visual }, -- last search pattern highlighting (see 'hlsearch')
    CurSearch = { link = "IncSearch" },
    Substitute = { link = "IncSearch" }, -- |:substitute| replacement text highlighting

    MatchParen = { fg = c.yellow, bold = true }, -- the character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|

    -- Messages
    ModeMsg = { fg = c.fluo, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = { fg = c.fluo }, -- area for messages and cmdline
    MoreMsg = { fg = c.fluo }, -- |more-prompt|
    ErrorMsg = { fg = c.error }, -- error messages on the command line
    WarningMsg = { fg = c.warning }, -- warning messages

    -- TODO: change with lualine color
    Pmenu = { bg = c.bg_gutter, fg = c.fg }, -- popup menu: normal item triggered for example when listing plugin commands in terminal
    PmenuSel = { fg = c.fluo }, -- popup menu: selected item.
    PmenuKindSel = { fg = c.to_check }, -- popup menu: selected item.
    PmenuSbar = { bg = c.grey[2] }, -- popup menu: scrollbar.
    PmenuThumb = { bg = c.grey[3] }, -- popup menu: Thumb of the scrollbar.

    FloatBorder = { fg = c.fg_float, bg = c.bg_float }, -- border of for example completion
    FloatTitle = { fg = c.red, bg = c.black },

    Question = { fg = c.bg_visual }, -- |hit-enter| prompt and yes/no questions

    QuickFixLine = { bg = c.bg_visual, fg = c.fg_visual, bold = true }, -- current |quickfix| item in the quickfix window
    qfLineNr = { fg = c.grey[4] },
    qfFileName = { fg = c.light_blue },
    qfSeparator = { fg = c.fg_sidebar },
    qfInfo = { fg = c.to_check },

    SpecialKey = { fg = c.to_check }, -- unprintable characters: text displayed differently from what it really is

    -- Spelling
    SpellBad = { undercurl = true }, -- word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { undercurl = true }, -- word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { undercurl = true }, -- word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { undercurl = true }, -- word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    -- enable below if you want aggressive spell visual
    -- SpellBad = { fg = c.error, undercurl = true }, -- word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap = { fg = c.warning, undercurl = true }, -- word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal = { fg = c.info, undercurl = true }, -- word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare = { fg = c.hint, undercurl = true }, -- word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

    Visual = { bg = c.bg_visual, fg = c.black }, -- visual mode selection
    VisualNOS = { bg = c.to_check }, -- visual mode selection when vim is "Not Owning the Selection".

    Constant = { fg = c.yellow }, -- (preferred) any constant
    String = { fg = c.light_blue }, --   a string constant: "this is a string"
    Character = { fg = c.cyan }, --  a character constant: 'c', '\n'
    Operator = { fg = c.green }, -- "sizeof", "+", "*", etc.
    Number = { link = "Constant" }, --   a number constant: 234, 0xff
    Boolean = { link = "Number" }, --  a boolean constant: TRUE, false
    Float = { link = "Number" }, --    a floating point constant: 2.3e10
    Statement = { fg = c.purple }, -- (preferred) any statement
    Keyword = { fg = c.red }, --  any other keyword
    Repeat = { link = "Operator" }, --   for, do, while, etc.
    Conditional = { link = "Operator" }, --  if, then, else, endif, switch, etc.
    Label = { link = "Keyword" }, --    case, default, etc.
    Exception = { link = "Keyword" }, --  try, catch, throw
    Type = { fg = c.purple }, -- (preferred) int, long, char, etc.
    StorageClass = { link = "Type" }, -- static, register, volatile, etc.
    Structure = { link = "Type" }, --  struct, union, enum, etc.
    Typedef = { link = "Type" }, --  A typedef
    Identifier = { fg = c.light_blue }, -- (preferred) any variable name
    Function = { fg = c.blue }, -- function name (also: methods for classes)
    Delimiter = { fg = c.grey[6] }, --  character that needs attention

    Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
    Bold = { bold = true, fg = c.fg }, -- (preferred) any bold text
    Italic = { italic = true, fg = c.fg }, -- (preferred) any italic text

    Error = { bg = c.bg, fg = c.red.dim }, -- (preferred) any erroneous construct
    Todo = { bg = c.bg, fg = c.teal.dim }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Warn = { bg = c.bg, fg = c.yellow.dim }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Note = { bg = c.bg, fg = c.light_blue.dim }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- TODO: study these. The colors of following items is accented to better see when they appear.
    Cursor = { fg = c.bg, bg = c.fg }, -- character under the cursor
    lCursor = { fg = c.bg, bg = c.fg }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = { fg = c.bg, bg = c.fg }, -- like Cursor, but used when in IME mode |CursorIM|
    TabLine = { bg = c.green, fg = c.fg_gutter }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.green }, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.green, bg = c.cyan }, -- tab pages line, active tab page label
    Title = { fg = c.light_blue, bold = true }, -- titles for output from ":set all", ":autocmd" etc.
    WildMenu = { bg = c.green }, -- current match in 'wildmenu' completion
    WinBar = { bg = c.green }, -- window bar
    WinBarNC = { bg = c.green }, -- window bar in inactive windows

    PreProc = { fg = c.cyan }, -- (preferred) generic Preprocessor
    Include = {}, --  preprocessor #include
    Define = {}, --   preprocessor #define
    Macro = {}, --    same as Define
    PreCondit = {}, --  preprocessor #if, #else, #endif, etc.

    Special = { fg = c.cyan }, -- (preferred) any special symbol
    SpecialChar = {}, --  special character in a constant
    Tag = {}, --    you can use CTRL-] on this
    SpecialComment = {}, -- special things inside a comment
    Debug = { fg = c.orange }, --    debugging statements
  }

  return theme
end

return M
