local M = {}

-- Defines the highlight group colors for diagnostic.
-- @param c The available colors.
function M.get(c, options)
  local theme = {}
  if options.light_theme then
    theme = {
      TodoBgTODO = { fg = c.bg, bg = c.Teal.very_dark },
      TodoFgTODO = { bg = c.bg, fg = c.Teal.very_dark },
      TodoBgWARN = { fg = c.bg, bg = c.Yellow.very_dark },
      TodoFgWARN = { bg = c.bg, fg = c.Yellow.very_dark },
      TodoBgFIX = { fg = c.bg, bg = c.Red.very_dark },
      TodoFgFIX = { bg = c.bg, fg = c.Red.very_dark },
      TodoBgNOTE = { fg = c.bg, bg = c.Light_blue.very_dark },
      TodoFgNOTE = { bg = c.bg, fg = c.Light_blue.very_dark },
    }
  else
    theme = {
      TodoBgTODO = { fg = c.bg, bg = c.Teal.very_bright },
      TodoFgTODO = { bg = c.bg, fg = c.Teal.very_bright },
      TodoBgWARN = { fg = c.bg, bg = c.Yellow.very_bright },
      TodoFgWARN = { bg = c.bg, fg = c.Yellow.very_bright },
      TodoBgFIX = { fg = c.bg, bg = c.Red.very_bright },
      TodoFgFIX = { bg = c.bg, fg = c.Red.very_bright },
      TodoBgNOTE = { fg = c.bg, bg = c.Light_blue.very_bright },
      TodoFgNOTE = { bg = c.bg, fg = c.Light_blue.very_bright },
    }
  end

  return theme
end

return M
