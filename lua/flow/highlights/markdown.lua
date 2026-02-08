local M = {}

-- Defines the highlight group colors for markdown
--- @param c table: The available colors.
--- @param o FlowConfig: The available options.
--- @return table: Markdown highlights.
function M.get(c, o)
  local is_transparent = o.theme.transparent

  local theme = {
    htmlH1 = { fg = c.purple, bold = true },
    htmlH2 = { fg = c.blue, bold = true },

    -- Code snippet
    markdownCode = { fg = c.grey[7] },
    mkdCodeDelimiter = { bg = c.grey[7], fg = c.fg },
    mkdCodeStart = { fg = c.blue, bold = true },
    mkdCodeEnd = { fg = c.blue, bold = true },
    mkdSnippetS = { bg = c.grey[3], fg = c.grey[6] },

    markdownHeadingDelimiter = { fg = c.orange, bold = true },
    markdownCodeBlock = { fg = c.blue },
    markdownH1 = { fg = c.purple, bold = true },
    markdownH2 = { fg = c.blue, bold = true },
    markdownLinkText = { fg = c.blue, underline = true },

    --- Markup
    ["@markup"] = { link = "@none" },

    ["@markup.raw.markdown"] = { fg = c.cyan },

    ["@markup.link"] = { fg = c.sky_blue },
    ["@markup.link.label"] = { link = "Function" },
    ["@markup.link.label.markdown_inline"] = { link = "@markup.link.label" },
    ["@markup.link.label.symbol"] = { link = "Identifier" },

    ["@markup.environment"] = { link = "Macro" },
    ["@markup.environment.name"] = { link = "Type" },

    ["@markup.quote"] = { fg = c.purple },

    ["@markup.raw"] = { link = "String" },
    ["@markup.math"] = { link = "Special" },

    ["@markup.strong"] = { bold = true },
    ["@markup.emphasis"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.heading"] = { link = "Title" },
    ["@markup.link.url"] = { link = "Underlined" },
    ["@keyword.directive.markdown"] = { fg = c.light_blue }, -- used for `---`
    ["@punctuation.special.markdown"] = { link = "@keyword.directive.markdown" },
    ["@spell.markdown"] = { link = "@spell" },

    ["@markup.list"] = { fg = c.yellow, bold = true }, -- For special punctuation that does not fall in the categories before. Also used in rust.
    ["@markup.list.unchecked"] = { fg = c.sky_blue }, -- For brackets and parens.
    ["@markup.list.checked"] = { fg = c.green }, -- For brackets and parens.

    ["@label.markdown"] = { link = "Keyword" }, -- Used for the language specified in codeblocks.

    ["@markup.raw.block"] = {
      bg = (is_transparent and c.transparent) or c.grey[2],
    }, --
    ["@markup.raw.markdown_inline"] = {
      fg = c.cyan,
      bg = c.grey[6],
    },

    -- Obsidian
    ObsidianRefText = { fg = c.blue },
  }

  local headers = { c.purple, c.blue, c.light_blue, c.cyan, c.sky_blue }
  for i, color in ipairs(headers) do
    theme["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
  end

  return theme
end

return M
