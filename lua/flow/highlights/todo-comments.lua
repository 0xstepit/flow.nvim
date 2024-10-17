local M = {}

-- Defines the highlight group colors for diagnostic.
-- @param c The available colors.
function M.get(c, options)
  local theme = {}
  if options.light_theme then
    theme = {
      TodoBgTODO = { fg = c.bg, bg = c.Sky_blue.very_dark },
      TodoFgTODO = { link = "Comment" },
      TodoBgWARN = { fg = c.bg, bg = c.Yellow.very_dark },
      TodoFgWARN = { link = "Comment" },
      TodoBgFIX = { fg = c.bg, bg = c.Red.very_dark },
      TodoFgFIX = { link = "Comment" },
      TodoBgNOTE = { fg = c.bg, bg = c.Light_blue.very_dark },
      TodoFgNOTE = { link = "Comment" },
    }
  else
    theme = {
      TodoBgTODO = { fg = c.bg, bg = c.Sky_blue.very_bright },
      TodoFgTODO = { link = "Comment" },
      TodoBgWARN = { fg = c.bg, bg = c.Yellow.very_bright },
      TodoFgWARN = { link = "Comment" },
      TodoBgFIX = { fg = c.bg, bg = c.Red.very_bright },
      TodoFgFIX = { link = "Comment" },
      TodoBgNOTE = { fg = c.bg, bg = c.Light_blue.very_bright },
      TodoFgNOTE = { link = "Comment" },
    }
  end

  return theme
end

return M
