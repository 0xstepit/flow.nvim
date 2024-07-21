package.path = package.path .. ";../?.lua;../flow/?.lua"

local util = require("util")

local M = {}

function M.generate(colors)
    return util.interpolate(M.template, colors)
end

M.template = [[
# Flow colorscheme | Tmux
# https://github.com/0xstepit/flow.nvim

## Statusbar style

set -g status-position top
set -g status-right-length "100" 
set -g status-left-length "100" 
set -g status-style bg=${bg_statusline},fg=${fg_statusline}
set -g window-status-style fg=${fg_statusline},bg=${bg_statusline}
setw -g window-status-separator " "
set -g window-status-current-style fg=colour198
set -g window-status-format "(#I) #W"
set -g window-status-current-format "(#I) #W"
set -g status-left "#[fg=${black},bg=${light_blue}] #S #[bg=${fg_gutter},fg=${light_blue}] #h #[bg=${bg_statusline}] "
set -g status-right "#[bg=${fg_gutter},fg=${light_blue}] %H:%M #[fg=${black},bg=${light_blue}] %A %d. %b %Y "

set -g message-command-style fg=${fluo}
set -g message-style "fg=${fluo}, bg=${bg_statusline}" # color used in the message popup.

set -g mode-style "fg=${fluo}"

## Borders
set -g pane-border-style "fg=${fg_border}"
set -g pane-active-border-style "fg=${fg_border}"

# Set below the rest of your config
# ...

]]

return M
