local M = {}

-- Defines the highlight for base color groups.
-- @param c The available colors.
function M.get(c, options)
  local theme = {

    Cursor = { fg = c.bg, bg = c.fg }, -- Character under the cursor.
    lCursor = { fg = c.bg, bg = c.fg }, -- The character under the cursor when |language-mapping| is used (see 'guicursor').
    CursorIM = { fg = c.bg, bg = c.fg }, -- Like Cursor, but used when in IME mode |CursorIM|.

    Title = { fg = c.purple, bold = true }, -- Titles for output from ":set all", ":autocmd" etc.
    Comment = { fg = c.comment }, -- Any comment.

    Normal = { fg = c.fg, bg = options.transparent and c.none or c.bg }, -- Normal text.
    NormalNC = { fg = c.grey[6], bg = options.transparent and c.none or c.bg }, -- Normal text in non-current windows.
    NormalSB = { fg = c.fg_sidebar, bg = options.transparent and c.none or c.bg_sidebar }, -- Normal text in sidebar.
    NormalFloat = { fg = c.fg_float, bg = options.transparent and c.none or c.bg_float }, -- Normal text in floating windows like documentation.

    Conceal = { fg = c.fg_visual, bold = true }, -- Placeholder characters substituted for concealed text (see 'conceallevel').

    NonText = { fg = c.grey[6] }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.

    Whitespace = { fg = options.transparent and c.transparent or c.bg }, -- "nbsp", "space", "tab" and "trail" in 'listchars'

    MatchParen = { fg = c.yellow, bold = true }, -- The character under the cursor if it is a paired bracket, and its match. |pi_paren.txt|.

    --Columns
    CursorLine = { bg = c.bg_highlight }, -- Used with the line set with 'cursorline'.
    ColorColumn = { link = "CursorLine" }, -- Used for the columns set with 'colorcolumn'.
    CursorColumn = { link = "CursorLine" }, -- Used with the column set with 'cursorcolumn'.
    FoldColumn = { bg = options.transparent and c.none or c.bg_gutter, fg = c.fg_gutter }, -- Info displayed in 'foldcolumn'.
    SignColumn = { link = "FoldColumn" }, -- Column where |signs| are displayed.

    -- Lines
    LineNr = { fg = c.fg_gutter }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = c.fg_visual }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    StatusLine = { fg = c.fg_statusline, bg = c.bg_statusline }, -- Status line of current window.
    StatusLineNC = { fg = c.fg_statusline, bg = c.bg_statusline }, -- Status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

    Directory = { fg = c.blue }, -- Directory names.

    EndOfBuffer = { fg = c.fg_highlight }, -- Filler lines (~) after the end of the buffer.

    VertSplit = { fg = c.fg_border, bold = true }, -- The column separating vertically split windows.
    WinSeparator = { link = "VertSplit" }, -- The column separating split windows.
    -- the horizontal split does not exists and the status line is used

    Folded = { fg = c.Light_blue.dim }, -- Line used for closed folds.

    -- Search
    IncSearch = { bg = c.fg_visual, fg = c.bg_visual }, -- Last search pattern highlighting (see 'hlsearch').
    Search = { bg = c.bg_visual, fg = c.fg_visual }, -- Used for 'incsearch' highlighting.
    CurSearch = { link = "IncSearch" },
    Substitute = { link = "IncSearch" }, -- |:substitute| replacement text highlighting.
    Visual = { link = "IncSearch" }, -- Visual mode selection.

    -- Messages
    ModeMsg = { fg = c.fg_visual, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ").
    MsgArea = { link = "Normal" }, -- Area for messages and cmdline.
    MoreMsg = { fg = c.fg_visual }, -- |more-prompt|.
    ErrorMsg = { fg = c.error }, -- Error messages on the command line.
    WarningMsg = { fg = c.warning }, -- Warning messages.

    -- Popup menu
    Pmenu = { bg = c.bg_popup, fg = c.fg_popup }, -- Popup menu: normal item triggered for example when listing plugin commands in terminal.
    PmenuSel = { bg = c.bg_popup, fg = c.fg_visual }, -- Popup menu: selected item.
    PmenuSbar = { bg = c.bg_popup }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = c.comment, bold = true }, -- Popup menu: Thumb of the scrollbar.

    -- Floating
    FloatBorder = { fg = c.fg_border, bg = c.bg_float }, -- Border of floating windows, like completion.
    FloatTitle = { fg = c.fg_float, bg = c.bg_float, bold = true }, -- Title of floating windows.

    Question = { fg = c.fg_visual }, -- |hit-enter| prompt and yes/no questions.

    -- Quickfix
    QuickFixLine = { bg = c.bg_visual, fg = c.fg_visual, bold = true }, -- Current |quickfix| item in the quickfix window.
    qfLineNr = { link = "CursorLineNr" },
    qfFileName = { link = "Directory" },
    qfSeparator = { fg = c.fg_sidebar }, -- Separator between quickfix line number and filename.

    -- Spelling
    SpellBad = { fg = options.aggressive_spell_visual and c.error or c.comment, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { fg = options.aggressive_spell_visual and c.warning or c.comment, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { fg = options.aggressive_spell_visual and c.info or c.comment, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { fg = options.aggressive_spell_visual and c.hint or c.comment, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

    WinBar = { bg = c.grey[3] }, -- Window bar,
    WinBarNC = { bg = c.grey[2] }, -- Window bar in inactive windows, used by dap-ui.

    Special = { fg = c.purple }, -- Any special symbol, like {} in lua.
    Tag = { fg = c.fg_visual }, -- You can use CTRL-] on this. Like Help tag in fugitive.

    TabLine = { bg = c.fluo, fg = c.fg_gutter }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.fluo }, -- tab pages line, where there are no labels
    TabLineSel = { link = "LineNr" }, -- Tab pages line, active tab page label. Used by Trouble for numbers

    Include = { fg = c.red }, --  preprocessor #include

    SpecialChar = { fg = c.teal }, --  special character in a constant. Heavily used in markdown.

    -- TODO: study these. The colors of following items is accented to better see when they appear.
    WildMenu = { bg = c.to_check }, -- current match in 'wildmenu' completion
    PmenuKindSel = { fg = c.to_check }, -- Popup menu: selected item.
    qfInfo = { fg = c.to_check },
    VisualNOS = { bg = c.to_check }, -- visual mode selection when vim is "Not Owning the Selection".
    SpecialKey = { fg = c.to_check }, -- Unprintable characters: text displayed differently from what it really is.
    PreProc = { fg = c.cyan }, -- (preferred) generic Preprocessor
    Define = { fg = c.to_check }, --   preprocessor #define
    Macro = { fg = c.to_check }, --    same as Define
    PreCondit = { fg = c.to_check }, --  preprocessor #if, #else, #endif, etc.
    SpecialComment = { fg = c.to_check }, -- special things inside a comment

    IblIndent = { link = "LineNr" },
    IblWhiteSpace = { fg = c.fluo },

    netrwClassify = { link = "Type" },
  }

  return theme
end

return M
