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
    ["@markup.raw.markdown_inline"] = { fg = c.grey[4] }, -- text between ``
    ["@markup.raw.block.markdown"] = { fg = c.grey[4] }, -- code snippet with language not known like Mermaid
    ["@markup.link"] = { fg = c.Cyan.dim },
    ["@markup.link.label"] = { link = "SpecialChar" },
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
    ["@markup.list"] = { fg = c.to_check }, -- For special punctutation that does not fall in the catagories before.
    ["@markup.list.markdown"] = { fg = c.orange, bold = true },
    ["@markup.list.unchecked"] = { fg = c.cyan }, -- For brackets and parens.
    ["@markup.list.checked"] = { fg = c.green }, -- For brackets and parens.
    ["@keyword.directive.markdown"] = { fg = c.yellow },
    ["@spell.markdown"] = { link = "@spell" },

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
