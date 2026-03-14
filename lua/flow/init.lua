local config = require("flow.config")
local theme = require("flow.theme")
local util = require("flow.util")

local M = {
  names = {
    classic = "flow",
    mono = "flow-mono",
  },
}

--- This function is called to setup the colorscheme options.
--- NOTE: this function is not called when executing `vim.cmd("colorscheme flow")`
M.setup = config._setup

--- This function is called when the colorscheme is activated.
--- It sets up the colorscheme by clearing existing highlights,
--- enabling true color support, setting the colorscheme name,
--- and applying the highlight groups defined in the theme.
--- This method is called with `vim.cmd("colorscheme flow")`.
--- @param variant string
function M.load(variant)
  vim.notify("Calling load with variant: " .. variant, vim.log.levels.WARN)
  -- Check if the current colorscheme is different from the one to be loaded.
  if not vim.tbl_contains(M.names, vim.g.colors_name) then
    vim.notify("Entering", vim.log.levels.WARN)
    -- Clear existing highlights.
    vim.cmd("hi clear")
    -- Enable true color support.
    vim.o.termguicolors = true
    -- Set the current colorscheme name.
    -- `:lua print(vim.g.colors_name)`
    vim.g.colors_name = M.names[variant]
  end

  -- Set the variant on the config so highlight modules can check it.
  config.options.variant = variant

  local highlights, colors = theme.configure()

  -- The heart of the plugin, where highlight groups are set.
  for group, hi in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, hi)
  end

  util.terminal(colors)
end

return M
