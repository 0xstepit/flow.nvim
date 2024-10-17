local M = {}

-- Defines the highlight for base color groups.
-- @param c The available colors.
function M.get(c, options)
  local theme = {

    -- Cursors
    -- These highlights groups are superseeded by the terminal colors used. For example,
    -- the colors used for the cursor are defined with Alacritty.
    Cursor = { fg = c.bg, bg = c.fg }, -- Character under the cursor.
    lCursor = { fg = c.bg, bg = c.fg }, -- The character under the cursor when |language-mapping| is used (see 'guicursor').
    CursorIM = { fg = c.bg, bg = c.fg }, -- Like Cursor, but used when in IME mode |CursorIM|.
    TermCursors = {}, -- Cursor in a focused terminal.
    TermCursorsNC = {}, -- Cursor in a unfocused terminal.

    -- Text
    Conceal = { fg = c.fg_visual, bold = true }, -- Placeholder characters substituted for concealed text (see 'conceallevel').
    Directory = { fg = c.blue }, -- Directory names.
    FloatTitle = { fg = c.fg_float, bg = c.bg_float, bold = true }, -- Title of floating windows.
    MatchParen = { fg = c.yellow, bold = true }, -- The character under the cursor if it is a paired bracket, and its match. |pi_paren.txt|.
    Normal = { fg = c.fg, bg = options.transparent and c.none or c.bg }, -- Normal text.
    NormalFloat = { fg = c.fg_float, bg = options.transparent and c.none or c.bg_float }, -- Normal text in floating windows like documentation.
    -- NormalNC = { fg = c.grey[6], bg = options.transparent and c.none or c.bg }, -- Normal text in non-current windows.
    -- NormalSB = { fg = c.fg_sidebar, bg = options.transparent and c.none or c.bg_sidebar }, -- Normal text in sidebar.
    Title = { fg = c.purple, bold = true }, -- Titles for output from ":set all", ":autocmd" etc.
    EndOfBuffer = { fg = c.fg_highlight }, -- Filler lines (~) after the end of the buffer.
    NonText = { fg = c.grey[3] }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Whitespace = { link = "LineNr" }, -- "nbsp", "space", "tab" and "trail" in 'listchars'. Set as bg to not show them.

    --Columns
    ColorColumn = { link = "CursorLine" }, -- Used for the columns set with 'colorcolumn'.
    CursorColumn = { link = "CursorLine" }, -- Used with the column set with 'cursorcolumn'.
    FoldColumn = { bg = options.transparent and c.none or c.bg_gutter, fg = c.fg_gutter }, -- Info displayed in 'foldcolumn'.
    SignColumn = { link = "FoldColumn" }, -- Column where |signs| are displayed.
    VertSplit = { fg = c.fg_border, bold = true }, -- The column separating vertically split windows.
    WinSeparator = { link = "VertSplit" }, -- The column separating split windows.

    -- Lines
    CursorLine = { bg = c.bg_highlight }, -- Used with the line set with 'cursorline'.
    CursorLineNr = { fg = c.fg_visual }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    Folded = { fg = c.Light_blue.dim }, -- Line used for closed folds.
    LineNr = { fg = c.fg_gutter }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove = { link = "LineNr" }, -- Line number for when the 'relativenumber' option is set, above the cursor line.
    LineNrBelow = { link = "LineNr" }, -- Line number for when the 'relativenumber' option is set, below the cursor line.
    StatusLine = { fg = c.fg_statusline, bg = c.bg_statusline }, -- Status line of current window.
    StatusLineNC = { fg = c.fg_statusline, bg = c.bg_statusline }, -- Status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { bg = c.fluo, fg = c.fg_gutter }, -- Tab pages line, not active tab page label.
    TabLineFill = { bg = c.fluo }, -- Tab pages line, where there are no labels.
    TabLineSel = { link = "LineNr" }, -- Tab pages line, active tab page label. Used by Trouble for numbers.

    -- Search and substitution
    IncSearch = { bg = c.Fluo.light, fg = c.bg_visual }, -- Last search pattern highlighting (see 'hlsearch').
    Search = { bg = c.bg_visual, fg = c.fg_visual }, -- Used for 'incsearch' highlighting.
    CurSearch = { link = "IncSearch" }, -- Used for highlighting a search pattern under the cursor (see 'hlsearch').
    Substitute = { link = "IncSearch" }, -- |:substitute| replacement text highlighting.
    Visual = { bg = c.fg_visual, fg = c.bg_visual }, -- Visual mode selection.
    VisualNOS = { bg = c.to_check }, -- visual mode selection when vim is "Not Owning the Selection".

    -- Messages
    ErrorMsg = { fg = c.error }, -- Error messages on the command line.
    ModeMsg = { fg = c.fg_visual, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ").
    MoreMsg = { fg = c.fg_visual }, -- |more-prompt|.
    MsgArea = { link = "Normal" }, -- Area for messages and cmdline.
    WarningMsg = { fg = c.warning }, -- Warning messages.
    MsgSeparator = { fg = c.to_check }, -- Separator for scrolled messages |msgsep|.

    -- Popup menu
    Pmenu = { bg = c.bg_popup, fg = c.fg_popup }, -- Popup menu: normal item triggered for example when listing plugin commands in terminal.
    PmenuExtra = {}, -- Popup menu: Normal item "extra text".
    PmenuExtraSel = {}, -- Popup menu: Selected item "kind".
    PmenuKindSel = { fg = c.to_check }, -- Popup menu: selected item.
    PmenuSbar = { bg = c.bg_popup }, -- Popup menu: scrollbar.
    PmenuSel = { bg = c.bg_popup, fg = c.fg_visual }, -- Popup menu: selected item.
    PmenuThumb = { bg = c.comment, bold = true }, -- Popup menu: Thumb of the scrollbar.

    -- Floating
    FloatBorder = { fg = c.fg_border, bg = c.bg_float }, -- Border of floating windows, like completion.

    -- Quickfix
    QuickFixLine = { bg = c.bg_visual, fg = c.fg_visual, bold = true }, -- Current |quickfix| item in the quickfix window.
    qfLineNr = { fg = c.grey[5] }, -- Line number in the quickfix.
    qfFileName = { link = "Directory" }, -- Name of the file in the quickfix.
    qfSeparator = { fg = c.fg_sidebar }, -- Separator between quickfix line number and filename.
    qfInfo = { fg = c.to_check },

    -- Spelling
    SpellBad = { fg = options.aggressive_spell_visual and c.error or c.comment, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { fg = options.aggressive_spell_visual and c.warning or c.comment, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { fg = options.aggressive_spell_visual and c.info or c.comment, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { fg = options.aggressive_spell_visual and c.hint or c.comment, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

    -- Misc
    -- I'm not sure where these groups are set.
    Define = { fg = c.grey[5] }, -- Preprocessor #define. Used in rust.

    IblIndent = { link = "LineNr" },
    IblWhiteSpace = { link = "LineNr" },

    Include = { fg = c.red }, --  preprocessor #include
    Menu = {}, -- Current font, background and foreground colors of the menus. Also used for the toolbar. Applicable highlight arguments: font, guibg, guifg.
    Question = { fg = c.fg_visual }, -- |hit-enter| prompt and yes/no questions.
    SnippetTabstop = {}, -- Tabstops in snippets. |vim.snippet|. Where you can add text in the snippet.
    WildMenu = { bg = c.to_check }, -- current match in 'wildmenu' completion

    WinBar = { bg = c.none }, -- Window bar,
    WinBarNC = { bg = c.none }, -- Window bar in inactive windows, used by dap-ui.

    netrwClassify = { link = "Type" },
    netrwHelpCmd = { fg = c.fluo },
  }

  return theme
end

return M
