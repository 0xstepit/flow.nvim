local M = {}

--- Default configuration options for the colorscheme.
--- @class FlowConfig
local defaults = {
  dark_theme = true, -- Set the theme with dark background.
  high_contrast = false, -- Make the dark background darker or the light background lighter.
  transparent = false, -- Set transparent background.
  fluo_color = "pink", -- Color used as fluo. Available values are pink, yellow, orange, or green.
  mode = "base", -- Mode of the colors. Available values are: dark, bright, desaturate, or base.
  aggressive_spell = false, -- Use colors for spell check.
}

M.options = vim.deepcopy(defaults)

--- This is the entry point of the configuration before loading the plugin.
--- It sets up the colorscheme options by merging the provided options with the default options.
--- @param options FlowConfig? Optional table to customize the colorscheme setup.
function M._setup(options)
  M.options = vim.tbl_deep_extend("force", {}, M.options, options or {})
end

return M
