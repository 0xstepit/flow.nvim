local M = {}

--- @param c table: The available colors.
--- @param o FlowConfig: The available options.
--- @return table: Render markdown plugin highlights.
function M.get(c, o)
  local theme = {
    RenderMarkdownCode = { link = "@markup.raw.block" }, -- Code blocks.
    RenderMarkdownCodeInline = { link = "@markup.raw.markdown_inline" }, -- Code inline.
    RenderMarkdownBullet = { link = "@markup.list" },
    RenderMarkdownDash = { link = "Comment" },

    -- TODO: complete
    -- | RenderMarkdownTableHead       | @markup.heading                    | Pipe table heading rows    |
    -- | RenderMarkdownTableRow        | Normal                             | Pipe table body rows       |
    -- | RenderMarkdownTableFill       | Conceal                            | Pipe table inline padding  |
    -- | RenderMarkdownSuccess         | DiagnosticOk                       | Success related callouts   |
    -- | RenderMarkdownInfo            | DiagnosticInfo                     | Info related callouts      |
    -- | RenderMarkdownHint            | DiagnosticHint                     | Hint related callouts      |
    -- | RenderMarkdownWarn            | DiagnosticWarn                     | Warning related callouts   |
    -- | RenderMarkdownError           | DiagnosticError                    | Error related callouts     |
  }

  -- Sequentially define headers background colors.
  local headersBg = {
    c.Fluo.light,
    c.Blue.very_light,
    c.Light_blue.very_light,
    c.Cyan.very_light,
    c.Sky_blue.very_light,
  }
  if o.theme.style == "dark" then
    headersBg = {
      c.Fluo.dark,
      c.Blue.very_dark,
      c.Light_blue.very_dark,
      c.Cyan.very_dark,
      c.Sky_blue.very_dark,
    }
  end

  -- TODO: hardcoded transparent background but should be based on config.
  for i, _ in ipairs(headersBg) do
    theme["RenderMarkdownH" .. i .. "Bg"] = { bg = c.transparent, bold = true }
  end

  return theme
end

return M
