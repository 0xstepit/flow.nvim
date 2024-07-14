local M = {}

-- Defines the highlight group colors for markdown
-- @param c The available colors.
function M.get(c)
  local theme = {
    htmlH1 = { fg = c.purple, bold = true },
    htmlH2 = { fg = c.blue, bold = true },

    mkdCodeDelimiter = { bg = c.terminal_black, fg = c.fg },
    mkdCodeStart = { fg = c.blue14, bold = true },
    mkdCodeEnd = { fg = c.blue14, bold = true },

    markdownHeadingDelimiter = { fg = c.orange, bold = true },
    markdownCode = { fg = c.blue14 },
    markdownCodeBlock = { fg = c.blue14 },
    markdownH1 = { fg = c.purple, bold = true },
    markdownH2 = { fg = c.blue, bold = true },
    markdownLinkText = { fg = c.blue, underline = true },
  }

  local headers = { c.base, c.base11, c.base12, c.base13, c.base14 }
  for i, color in ipairs(headers) do
    theme["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
  end

  return theme
end

return M
