package.path = package.path .. ";../?.lua;../flow/?.lua"

local util = require("util")

local M = {}

function M.generate(colors)
  return util.interpolate(M.template, colors)
end

M.template = [[
# Flow colorscheme | Tmux
# https://github.com/0xstepit/flow.nvim

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
--border \
--height 40% \
--layout=reverse \
--color=bg+:${bg_highlight} \
--color=fg:${fg} \
--color=fg+:${fg} \
--color=hl:${comment} \
--color=hl+:${comment} \
--color=border:${bg_border} \
--color=info:${light_blue} \
--color=marker:${purple} \
--color=pointer:${fluo} \
--color=prompt:${fluo} \
--color=spinner:${fluo} \
--color=header:${blue}"
]]

return M
