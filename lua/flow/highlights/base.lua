local hsl = require("flow.util").hsl_to_hex

local M = {}

-- Defines the highlight for base color groups.
--- @param c table: The available colors.
--- @param o FlowConfig: The available options.
--- @return table: Base highlights.
function M.get(c, o)
  local is_dark = o.theme.style == "dark"
  local is_aggressive_spell = o.ui.aggressive_spell
  local theme = {
    -- Windows
    Normal = { fg = c.fg, bg = c.bg }, -- Normal text.
    NormalFloat = { fg = c.fg_float, bg = c.bg_float }, -- Normal text in floating windows like documentation.
    NormalSB = { fg = c.fg_sidebar, bg = c.bg_sidebar }, -- Normal text in the sidebar.

    -- Gutter elements
    FoldColumn = { bg = c.bg_gutter, fg = c.fg_gutter }, -- Info displayed in 'foldcolumn'.
    SignColumn = { link = "FoldColumn" }, -- Column where |signs| are displayed.
    LineNr = { link = "FoldColumn" },
    LineNrAbove = { link = "LineNr" },
    LineNrBelow = { link = "LineNr" },

    -- Highlighted elements
    -- CursorLine = { bg = c.bg_highlight }, -- Used with the line set with 'cursorline'.
    CursorLine = { bg = hsl(331, 20, 13) }, -- Used with the column set with 'cursorcolumn'.
    ColorColumn = { bg = c.bg_highlight }, -- Used for the columns set with 'colorcolumn'.
    CursorColumn = { link = "ColorColumn" }, -- Used with the column set with 'cursorcolumn'.
    Folded = { link = "ColorColumn" }, -- Line used for closed folds.
    CursorLineNr = { fg = c.fluo },

    -- Info lines
    StatusLine = { fg = c.fg_statusline, bg = c.bg_statusline }, -- Status line of current window.
    StatusLineNC = { fg = c.fg_statusline, bg = c.bg_statusline }, -- Status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { bg = c.bg_statusline, fg = c.fg_statusline },
    TabLineFill = { bg = c.bg_statusline },
    TabLineSel = { bg = c.bg, fg = c.light_blue }, -- Tab pages line, active tab page label. Used by Trouble for numbers.

    -- Borders
    VertSplit = { fg = c.fg_vsplit }, -- The column separating vertically split windows.
    WinSeparator = { link = "VertSplit" }, -- The column separating split windows.
    Border = { bg = c.transparent, fg = c.fg_border, bold = true }, -- Transparent border for plugin UIs
    FloatBorder = { bg = c.transparent, fg = c.fg_border }, -- Border of floating windows, like completion.

    -- Cursors
    -- NOTE: these highlights groups are superseeded by the terminal colors used. For example,
    -- the colors used for the cursor are defined in the Alacritty's config.
    Cursor = { fg = c.flow, bg = c.fg }, -- Character under the cursor.
    lCursor = { fg = c.flow, bg = c.fg }, -- The character under the cursor when |language-mapping| is used (see 'guicursor').
    CursorIM = { fg = c.bg, bg = c.fg }, -- Like Cursor, but used when in IME mode |CursorIM|.

    -- Text
    Directory = { fg = c.blue }, -- Directory names.
    MatchParen = { fg = c.fluo, bold = true }, -- The character under the cursor if it is a paired bracket, and its match. |pi_paren.txt|.
    Title = { fg = c.purple, bold = true }, -- Titles for output from ":set all", ":autocmd" etc.
    FloatTitle = { fg = c.fg_float, bg = c.bg_float, bold = true }, -- Title of floating windows.
    FlowPluginTitle = { bg = c.transparent, fg = c.fg_border }, -- Titles for plugin UIs (Telescope, Avante)
    Whitespace = { link = "Comment" }, -- "nbsp", "space", "tab" and "trail" in 'listchars'. Set as bg to not show them.
    NonText = { fg = c.grey[4] }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    EndOfBuffer = { link = "NonText" }, -- Filler lines (~) after the end of the buffer.
    Conceal = { fg = c.fg }, -- Placeholder characters substituted for concealed text (see 'conceallevel').

    -- Search and substitution
    IncSearch = { bg = c.fluo, fg = c.grey[2] },
    Search = { bg = c.grey[7], fg = c.light_blue },
    CurSearch = { bg = (not is_dark and c.Fluo.dark) or c.Fluo.light, fg = c.bg_visual }, -- Used for highlighting a search pattern under the cursor (see 'hlsearch').
    Substitute = { link = "IncSearch" }, -- |:substitute| replacement text highlighting.

    Visual = { bg = c.bg_visual }, -- Visual mode selection.
    VisualNOS = { bg = c.to_check }, -- visual mode selection when vim is "Not Owning the Selection".

    -- Messages
    MsgArea = { link = "Normal" }, -- Area for messages and cmdline.
    ModeMsg = { fg = c.fluo }, -- 'showmode' message (e.g., "-- INSERT -- ").
    MoreMsg = { fg = c.bg_visual }, -- |more-prompt|.
    ErrorMsg = { fg = c.error }, -- Error messages on the command line.
    WarningMsg = { fg = c.warning }, -- Warning messages.
    MsgSeparator = { fg = c.to_check }, -- Separator for scrolled messages |msgsep|.

    -- Popup menu
    Pmenu = { bg = c.bg_popup, fg = c.fg_popup }, -- Popup menu: normal item triggered for example when listing plugin commands in terminal.
    PmenuSel = { bg = c.bg_visual }, -- Popup menu: selected item.
    PmenuThumb = { bg = c.grey[6], bold = true }, -- Popup menu: Thumb of the scrollbar.
    PmenuSbar = { bg = c.bg_popup }, -- Popup menu: scrollbar.

    -- Quickfix
    QuickFixLine = { bg = c.bg_visual }, -- Current |quickfix| item in the quickfix window.
    qfLineNr = { link = "LineNr" }, -- Line number in the quickfix.
    qfFileName = { link = "Directory" }, -- Name of the file in the quickfix.
    qfSeparator = { link = "qfLineNr" }, -- Separator between quickfix line number and filename.

    -- Spelling
    SpellBad = {
      fg = is_aggressive_spell and c.error or c.comment,
      undercurl = true,
    }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = {
      fg = is_aggressive_spell and c.warning or c.comment,
      undercurl = true,
    }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = {
      fg = is_aggressive_spell and c.info or c.comment,
      undercurl = true,
    }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = {
      fg = is_aggressive_spell and c.hint or c.comment,
      undercurl = true,
    }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

    -- Misc
    -- I'm not sure where these groups are set.
    Define = { fg = c.grey[8] }, -- Preprocessor #define. Used in rust.
    Include = { fg = c.red }, --  preprocessor #include
    Question = { fg = c.bg_visual }, -- |hit-enter| prompt and yes/no questions.
    WildMenu = { bg = c.to_check }, -- current match in 'wildmenu' completion
    WinBar = { bg = c.none }, -- Window bar,
    WinBarNC = { bg = c.none }, -- Window bar in inactive windows, used by dap-ui.

    -- Netrw
    netrwClassify = { link = "Keyword" },
    netrwHelpCmd = { fg = c.fluo },

    -- Flow Base Groups - Semantic groups for consistent UI across plugins
    -- Headers and titles used by plugin UIs
    FlowHeader = { bg = c.fluo, fg = c.grey[3] }, -- Main header for plugin UIs (Lazy, Mason)
    FlowHighlightBlock = { bg = c.light_blue, fg = c.grey[3], bold = true }, -- Highlighted/active block

    -- Interactive elements
    FlowButton = { bg = c.grey[7], fg = c.grey[3] }, -- Standard button
    FlowButtonActive = { bg = c.light_blue, fg = c.grey[3], bold = true }, -- Active/selected button

    -- State indicators - consistent colors for success/error/warning/info across plugins
    FlowSuccess = { fg = c.green }, -- Success state (git add, DAP play)
    FlowError = { fg = c.error }, -- Error state (git delete, DAP stop, breakpoints)
    FlowWarning = { fg = c.warning }, -- Warning state
    FlowInfo = { fg = c.light_blue }, -- Info/neutral action state
  }

  return theme
end

return M
