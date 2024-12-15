local util = require("flow.util")

local M = {}

function M.generate(colors)
  return util.interpolate(M.template, colors)
end

M.template = [=[
# Flow colorscheme | Kitty 
# https://github.com/0xstepit/flow.nvim

# Basic colors
background ${bg}
foreground ${fg}
selection_foreground ${fluo} 
selection_background ${black} 

# Normal colors
color0 ${black}
color1 ${red}
color2 ${green}
color3 ${yellow}
color4 ${light_blue}
color5 ${purple}
color6 ${cyan}
color7 ${white}

# Bright colors
color8 ${fg_statusline}
color9 ${red}
color10 ${green}
color11 ${yellow}
color12 ${light_blue}
color13 ${purple}
color14 ${cyan}
color15 ${white}

# Url color
url_color ${light_blue}

# Cursor
cursor ${fluo}
cursor_text_color ${black}

# Tabs
active_tab_background ${light_blue} 
active_tab_foreground ${black}
inactive_tab_background ${fg_statusline}
inactive_tab_foreground ${light_blue}

# Borders
active_border_color ${blue} 
inactive_border_color ${fg_statusline}
]=]

return M
