local M = {}

--- Default configuration options for the colorscheme.
--- @class FlowConfig
local defaults = {
  light_theme = false,
  transparent = false, -- Set transparent background.
  fluo_color = "pink", -- Fluo color: pink, yellow, orange, or green.
  mode = "normal", -- Intensity of the palette: normal, dark, desaturate, orbright. Notice that dark is ugly!
  aggressive_spell = false, -- Display colors for spell check.
}

M.options = defaults

--- This is the entry point of the configuration before loading the plugin.
--- It sets up the colorscheme options by merging the provided options with the default options.
--- @param options FlowConfig A table of options to customize the colorscheme setup.
function M._setup(options)
  M.options = vim.tbl_deep_extend("force", {}, M.options or defaults, options or {})
end

return M
