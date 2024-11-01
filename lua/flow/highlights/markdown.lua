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
    mkdSnippetS = { bg = c.grey[2], fg = c.grey[3] },

    markdownHeadingDelimiter = { fg = c.orange, bold = true },
    markdownCodeBlock = { fg = c.blue },
    markdownH1 = { fg = c.purple, bold = true },
    markdownH2 = { fg = c.blue, bold = true },
    markdownLinkText = { fg = c.blue, underline = true },

    --- Markup
    ["@markup.raw.markdown"] = { fg = c.cyan },
    ["@markup.raw.markdown_inline"] = {
      fg = c.cyan,
      bg = c.grey[3],
    }, -- Text between ``.
    ["@markup.raw.block.markdown"] = { fg = c.grey[4] }, -- Code snippet with language not known like Mermaid.
    ["@markup.link"] = { fg = c.sky_blue },
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
    ["@markup.list.markdown"] = { fg = c.yellow, bold = true },
    ["@markup.list.unchecked"] = { fg = c.cyan }, -- For brackets and parens.
    ["@markup.list.checked"] = { fg = c.green }, -- For brackets and parens.
    ["@keyword.directive.markdown"] = { fg = c.yellow },
    ["@spell.markdown"] = { link = "@spell" },
    ["@markup.list"] = { fg = c.grey[5] }, -- For special punctuation that does not fall in the categories before. Also used in rust.
    ["@lable.markdown"] = { fg = c.purple }, -- Used for the language specified in codeblocks.

    -- Obsidian
    ObsidianRefText = { fg = c.blue },
  }

  local headers = { c.fluo, c.blue, c.light_blue, c.cyan, c.sky_blue }
  for i, color in ipairs(headers) do
    theme["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
  end

  return theme
end

return M
