local util = require("flow.util")

local M = {}

function M.generate(colors)
  return util.interpolate(M.template, colors)
end

M.template = [=[
# Flow colorscheme | Ghostty
# https://github.com/0xstepit/flow.nvim

# black
palette = 0=${grey7}
palette = 8=${grey7}
# red
palette = 1=${red}
palette = 9=${red}
# green
palette = 2=${green}
palette = 10=${green}
# yellow
palette = 3=${yellow}
palette = 11=${yellow}
# blue
palette = 4=${light_blue}
palette = 12=${light_blue}
# purple
palette = 5=${purple}
palette = 13=${purple}
# aqua
palette = 6=${cyan}
palette = 14=${cyan}
# white
palette = 7=${white}
palette = 15=${white}

background = ${bg}
foreground = ${fg}
cursor-color = ${fluo}
cursor-text = ${fg}
selection-background = ${fluo}
selection-foreground = ${black}
]=]

return M
