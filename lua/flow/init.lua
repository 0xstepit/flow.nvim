local config = require("flow.config")
local theme = require("flow.theme")

local M = {}

M.name = "flow"

--- This function is called when the colorscheme is activated.
--- It sets up the colorscheme by clearing existing highlights,
--- enabling true color support, setting the colorscheme name,
--- and applying the highlight groups defined in the theme.
--- @param opts table: A table of options to customize the colorscheme setup.
function M.load(opts)
  -- Check if the current colorscheme is different from the one to be loaded.
  if vim.g.colors_name ~= M.name then
    -- Clear existing highlights.
    vim.cmd("hi clear")
    -- Enable true color support.
    vim.o.termguicolors = true
    -- Set the current colorscheme name.
    vim.g.colors_name = M.name
  end

  if opts then
    M.setup(opts)
  end

  local highlights = theme.configure()

  -- The heart of the plugin, where highlight groups are set.
  for group, c in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, c)
  end
end

--- This function is called to setup the colorscheme options.
M.setup = config._setup

return M
