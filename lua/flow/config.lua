local M = {}

--- Default configuration options for the colorscheme.
--- @class FlowConfig
--- TODO: add @field description
M.defaults = {
  dark_theme = true, -- Set the theme with dark background.
  high_contrast = false, -- Make the dark background darker or the light background lighter.
  transparent = false, -- Set transparent background.
  fluo_color = "pink", -- Color used as fluo. Available values are pink, yellow, orange, or green.
  mode = "default", -- Mode of the colors. Available values are: default, dark, or bright.
  borders = "light", -- Border style. Available values are: light, dark, fluo, none.
  aggressive_spell = false, -- Use colors for spell check.
}

--- @type FlowConfig
M.options = {}

--- Valid values for configuration options
M.valid_options = {
  fluo_colors = { "pink", "cyan", "yellow", "orange", "green" },
  modes = { "default", "dark", "bright" },
  borders = { "light", "dark", "fluo", "none" },
}

--- Validate configuration options
--- @param opts FlowConfig
--- @return boolean, string?
local function validate_options(opts)
  if opts.fluo_color and not vim.tbl_contains(M.valid_options.fluo_colors, opts.fluo_color) then
    return false, string.format("Invalid fluo color: %s", opts.fluo_color)
  end

  if opts.mode and not vim.tbl_contains(M.valid_options.modes, opts.mode) then
    return false, string.format("Invalid mode: %s", opts.mode)
  end

  if opts.borders and not vim.tbl_contains(M.valid_options.borders, opts.borders) then
    return false, string.format("Invalid border: %s", opts.borders)
  end

  return true
end

--- This is the entry point of the configuration before loading the plugin.
--- It sets up the colorscheme options by merging the provided options with
--- the default configuration.
--- @param opts FlowConfig? Optional table to customize the colorscheme setup.
function M._setup(opts)
  -- Short circuit if options have been already set. This happen when the colorscheme is loaded from
  -- the plugin manager because first set the options,and then set the colorscheme.
  if not vim.tbl_isempty(M.options) then
    return
  end

  local ok, err = validate_options(opts or {})
  if not ok then
    opts = {}
    vim.notify("Error setting user options, fallback to defaults: " .. err, vim.log.levels.WARN)
  end

  M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
end

return M
