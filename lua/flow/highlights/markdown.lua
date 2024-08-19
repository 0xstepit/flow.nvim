local M = {}

-- Defines the highlight group colors for markdown
-- @param c The available colors.
function M.get(c, options)
  local theme = {
    htmlH1 = { fg = c.purple, bold = true },
    htmlH2 = { fg = c.blue, bold = true },

    -- Code snippet
    markdownCode = { fg = c.grey[4] },
    mkdCodeDelimiter = { bg = c.grey[4], fg = c.fg },
    mkdCodeStart = { fg = c.blue, bold = true },
    mkdCodeEnd = { fg = c.blue, bold = true },

    markdownHeadingDelimiter = { fg = c.orange, bold = true },
    markdownCodeBlock = { fg = c.blue },
    markdownH1 = { fg = c.purple, bold = true },
    markdownH2 = { fg = c.blue, bold = true },
    markdownLinkText = { fg = c.blue, underline = true },

    --- Markup
    ["@markup.raw.markdown"] = { fg = c.cyan },
    ["@markup.raw.markdown_inline"] = {
      fg = c.cyan,
      bg = options.light_theme and c.Cyan.very_bright or c.Cyan.very.dark,
    }, -- Text between ``.
    ["@markup.raw.block.markdown"] = { fg = c.grey[4] }, -- Code snippet with language not known like Mermaid.
    ["@markup.link"] = { fg = c.teal },
    ["@markup.link.label"] = { link = "Function" },
    ["@markup.link.label.symbol"] = { link = "Identifier" },
    ["@markup"] = { link = "@none" },
    ["@markup.environment"] = { link = "Macro" },
    ["@markup.environment.name"] = { link = "Type" },
    ["@markup.raw"] = { link = "String" },
    ["@markup.math"] = { link = "Special" },
    ["@markup.strong"] = { bold = true },
    ["@markup.emphasis"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.heading"] = { link = "Title" },
    ["@markup.link.url"] = { link = "Underlined" },
    ["@markup.list.markdown"] = { fg = c.orange, bold = true },
    ["@markup.list.unchecked"] = { fg = c.cyan }, -- For brackets and parens.
    ["@markup.list.checked"] = { fg = c.green }, -- For brackets and parens.
    ["@keyword.directive.markdown"] = { fg = c.yellow },
    ["@spell.markdown"] = { link = "@spell" },
    ["@markup.list"] = { fg = c.grey[5] }, -- For special punctuation that does not fall in the categories before. Also used in rust.
    ["@lable.markdown"] = { fg = c.purple }, -- Used for the language specified in codeblocks.

    -- Obsidian
    ObsidianRefText = { fg = c.blue },
  }

  local headers = { c.purple, c.light_blue, c.blue, c.cyan, c.teal }
  for i, color in ipairs(headers) do
    theme["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
  end

  return theme
end

return M
