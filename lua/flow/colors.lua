local M = {}

M.colors = nil

M._color_names =
  { "orange", "yellow", "red", "purple", "blue", "light_blue", "sky_blue", "cyan", "green" }

-- Setup the colorscheme colors based on the options and palette.
--- @param opts FlowConfig: The options to setup the colorscheme.
function M.setup(opts)
  local default_palette = require("flow.palette").get()

  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "qf" }, -- 'qf' is the filetype for Quickfix
    callback = function()
      vim.schedule(function()
        vim.api.nvim_win_set_option(0, "winhighlight", "Normal:NormalFloat,FoldColumn:NormalFloat")
        vim.opt.colorcolumn = ""
      end)
    end,
  })

  local colors = {
    -- Core colors
    transparent = default_palette.transparent,
    black = default_palette.black,
    white = default_palette.white,
    grey = default_palette.grey,

    -- Fluo colors
    fluo = default_palette.fluo.pink.default,
    -- Full palette of the fluo colors.
    Fluo = default_palette.fluo.pink,

    -- Debug: some hi are still a mystery to me, use fluo green to discover them.
    to_check = default_palette.fluo.green.default,
  }

  opts = opts or {}
  M._apply_opts(default_palette, colors, opts)

  colors.fg = default_palette.grey[6] -- used for text in the colorscheme

  -- Handle mode-specific colors.
  local mode = opts.mode or "default"
  local modes = { "default", "dark", "bright" }
  if not M._tbl_contains(modes, mode) then
    vim.notify(
      "Invalid mode: '" .. mode .. "'. Falling back to `default` mode.",
      vim.log.levels.WARN
    )
    mode = "default"
  end

  for _, key in ipairs(M._color_names) do
    -- Set the specific mode of the colors.
    colors[key] = default_palette[key][mode]
    -- Store all the color variations. These variables are used for hi that
    -- requires contrasts with the current theme, like git.
    local Key = key:gsub("^%l", string.upper)
    colors[Key] = default_palette[key]
  end

  colors.comment = default_palette.grey[4] -- slightly brighter than gutter

  -- +------------------------------------------------------------+
  -- | Sidebar (e.g., NERDTree, Telescope, Quickfix)              | <- Sidebar
  -- |                                                            |
  -- | Folder1/                                                   |
  -- | ├─ file1.txt                                               |
  -- | ├─ file2.txt                                               |
  -- |                                                            |
  -- +------------------------------------------------------------+
  -- | Gutter | Main Buffer Area                                  |
  -- |        |                                                   |
  -- |  1     | fn main() {                                       |
  -- |  + Git |     println!("Hello, Neovim!");                   | <- Main Buffer
  -- |  3     | }                                                 |
  -- |        |                                                   |
  -- |  5     | // Additional code here                           |
  -- |        |                                                   |
  -- +------------------------------------------------------------+
  -- | Statusline: [Mode] [Filename] [Cursor Position]            | <- Statusline
  -- +------------------------------------------------------------+
  -- | Command Line/Prompt Area                                   | <- Command Line
  -- +------------------------------------------------------------+

  -- Sidebar: used by the quickfix list, help, and explorer windows.
  colors.fg_sidebar = default_palette.grey[5]
  colors.bg_sidebar = colors.bg

  -- Gutter: used for line numbers, signs, and fold column.
  colors.fg_gutter = colors.grey[3]
  colors.bg_gutter = colors.bg

  -- Float: used for visual elements that are floating and triggered by the user.
  colors.fg_float = colors.grey[5]
  colors.bg_float = default_palette.transparent

  -- Popups: use for completion menu and all visual components that appears autonomously.
  colors.fg_popup = default_palette.grey[6]
  colors.bg_popup = (opts.transparent and default_palette.transparent) or colors.grey[1]

  -- Statusline and tabline
  colors.fg_statusline = colors.grey[3]
  colors.bg_statusline = colors.grey[1]

  -- Borders
  colors.fg_border = default_palette.grey[4]
  colors.bg_border = default_palette.grey[3]

  -- Visual
  colors.bg_visual = colors.grey[1]
  colors.fg_visual = colors.fluo

  -- Highlights
  colors.fg_highlight = colors.fluo
  colors.bg_highlight = colors.grey[1]

  -- Git
  colors.git = {
    add = colors.green, -- Added files/lines
    change = colors.yellow, -- Modified files/lines
    delete = colors.red, -- Deleted files/lines
    ignore = colors.grey[4], -- Ignored files
    untrcked = colors.sky_blue, -- New untracked files
  }

  colors.diff = {
    add = not opts.dark_theme and colors.Green.very_bright or colors.Green.very_dark,
    delete = not opts.dark_theme and colors.Red.very_bright or colors.Red.very_dark,
    change = not opts.dark_theme and colors.Light_blue.very_bright or colors.Sky_blue.very_dark,
    text = not opts.dark_theme and colors.Cyan.very_bright or colors.Cyan.very_dark,
  }

  -- LSP diagnostics
  colors.error = colors.Red.default -- Error messages
  colors.warning = colors.Yellow.default -- Warning messages
  colors.info = colors.Cyan.default -- Information messages
  colors.hint = colors.Light_blue.default -- Hints and suggestions

  -- Special Comments
  colors.todo = colors.Sky_blue.default -- TODO comments
  colors.note = colors.Green.default -- NOTE comments
  colors.fixme = colors.Red.default -- FIXME comments
  colors.hack = colors.Yellow.default -- HACK comments

  M.colors = colors

  return colors
end

function M._tbl_contains(tab, val)
  for _, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end

--- @param t table: The table to swap elements.
--- @param a number: The index of the first element to swap.
--- @param b number: The index of the second element to swap.
function M._swap(t, a, b)
  t[a], t[b] = t[b], t[a]
end

function M._apply_opts(default_palette, colors, opts)
  if opts.fluo_color then
    colors.fluo = default_palette.fluo[opts.fluo_color].default
    colors.Fluo = default_palette.fluo[opts.fluo_color]
  end

  -- Apply changes if the theme is not dark.
  -- HACK: this has to be executed before all changes that involves white, black, and grey.
  if not opts.dark_theme then
    M._invert_colors_for_theme(colors)
  end

  -- If high contrast the darkest color is swap for the next color and the
  -- lightest color is swap for the color before.
  if opts.high_contrast then
    M._invert_colors_for_contrast(colors)
  end

  colors.bg = (opts.transparent and default_palette.transparent) or default_palette.grey[2] -- used for theme background
end

function M._invert_colors_for_theme(colors)
  -- TODO: given how they are used, it is better to call them fg and bg?
  -- Invert black and white if the theme is not dark.
  colors.white, colors.black = colors.black, colors.white
  local n_greys = #colors.grey

  for i = 1, math.floor(n_greys / 2) do
    M._swap(colors.grey, i, n_greys + 1 - i)
  end
end

function M._invert_colors_for_contrast(colors)
  colors.grey[1], colors.grey[2] = colors.grey[2], colors.grey[1]
  colors.grey[6], colors.grey[7] = colors.grey[7], colors.grey[6]
end

return M
