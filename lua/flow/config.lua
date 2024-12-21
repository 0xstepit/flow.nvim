local M = {}

--- Default configuration options for the colorscheme.
--- @class FlowConfig
M.defaults = {
  --- @class Theme
  theme = {
    ---@alias Style "dark" | "light"
    style = "dark",
    ---@alias Contrast "default" | "high"
    contrast = "default",
    ---@boolean
    transparent = false,
  },
  colors = {
    ---@alias Mode "default" | "dark" | "bright"
    mode = "default",
    ---@alias Fluo "pink" | "cyan" | "yellow" | "orange" | "green"
    fluo = "pink",
  },
  ui = {
    ---@alias Border "light" | "dark" | "fluo" | "none"
    borders = "light",
    ---@boolean
    aggressive_spell = false,
  },
}

--- @type FlowConfig
M.options = {}

--- Valid values for configuration options
M.valid_options = {
  fluo_colors = { "pink", "cyan", "yellow", "orange", "green" },
  modes = { "default", "dark", "bright" },
  borders = { "light", "dark", "fluo", "none" },
  contrast = { "default", "high" },
}

--- Validate configuration options
--- @param opts FlowConfig
--- @return boolean, string?
local function validate_options(opts)
  -- Validate theme options.
  if opts.theme then
    if
      opts.theme.contrast and not vim.tbl_contains(M.valid_options.contrast, opts.theme.contrast)
    then
      return false, string.format("Invalid border: %s", opts.theme.contrast)
    end
  end

  -- Validate color options.
  if opts.colors then
    if opts.colors.fluo and not vim.tbl_contains(M.valid_options.fluo_colors, opts.colors.fluo) then
      return false, string.format("Invalid fluo color: %s", opts.colors.fluo)
    end

    if opts.colors.mode and not vim.tbl_contains(M.valid_options.modes, opts.colors.mode) then
      return false, string.format("Invalid mode: %s", opts.colors.mode)
    end
  end

  -- Validate ui options
  if opts.ui then
    if opts.ui.borders and not vim.tbl_contains(M.valid_options.borders, opts.ui.borders) then
      return false, string.format("Invalid border: %s", opts.ui.borders)
    end
  end
  return true
end

--- This is the entry point of the configuration before loading the plugin.
--- It sets up the colorscheme options by merging the provided options with
--- the default configuration.
--- @param opts FlowConfig? Optional table to customize the colorscheme setup.
function M._setup(opts)
  -- -- Short circuit if options have been already set. This happen when the colorscheme is loaded from
  -- -- the plugin manager because first set the options,and then set the colorscheme.
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
