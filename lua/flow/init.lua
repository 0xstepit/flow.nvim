local config = require("flow.config")
local theme = require("flow.theme")
local util = require("flow.util")

local M = {}

M.name = "flow"

-- This function is called when the colorscheme is activated.
function M.load_colorscheme(opts)
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = M.name

  print("Theme setup")
  local h = theme.setup()
  for group, c in pairs(h) do
    vim.api.nvim_set_hl(0, group, c)
  end
end

-- This function is called to setup the colorscheme options.
M.setup_options = config.setup

return M
