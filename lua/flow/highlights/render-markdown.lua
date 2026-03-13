local M = {}

--- @param colors table The available colors.
--- @param config FlowConfig The available options.
--- @return table Render markdown plugin highlights.
function M.get(colors, config)
  local theme = {
    RenderMarkdownCode = { link = "@markup.raw.block" },
    RenderMarkdownCodeInline = { link = "@markup.raw.markdown_inline" },
    RenderMarkdownBullet = { link = "@markup.list" },
    RenderMarkdownDash = { link = "Comment" },
  }

  -- Sequentially define headers background colors.
  local headersBg = {
    colors.Fluo.light,
    colors.Blue.very_light,
    colors.Light_blue.very_light,
    colors.Cyan.very_light,
    colors.Sky_blue.very_light,
  }
  if config.theme.style == "dark" then
    headersBg = {
      colors.Fluo.dark,
      colors.Blue.very_dark,
      colors.Light_blue.very_dark,
      colors.Cyan.very_dark,
      colors.Sky_blue.very_dark,
    }
  end

  for i, _ in ipairs(headersBg) do
    theme["RenderMarkdownH" .. i .. "Bg"] = { bg = colors.transparent, bold = true }
  end

  return theme
end

return M
