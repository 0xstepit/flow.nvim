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
    ---@alias Mode "default" | "dark" | "light"
    mode = "default",
    ---@alias Fluo "pink" | "cyan" | "yellow" | "orange" | "green"
    fluo = "pink",
    custom = {
      saturation = "", -- Custom sturation value (0-360)
      light = "", -- Custom lightness value (0-100)
    },
  },
  ui = {
    ---@alias Borders "theme" | "inverse" | "fluo" | "none"
    borders = "inverse",
    ---@boolean
    aggressive_spell = false,
  },
}

--- @type FlowConfig
M.options = {}

--- Valid values for configuration options
M.valid_options = {
  fluo_colors = { "pink", "cyan", "yellow", "orange", "green" },
  modes = { "default", "dark", "light" },
  borders = { "theme", "inverse", "fluo", "none" },
  contrast = { "default", "high" },
  custom_ranges = {
    saturation = { min = 0, max = 100 },
    light = { min = 0, max = 100 },
  },
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

    -- Validate custom color values for hue and light
    if opts.colors.custom then
      if opts.colors.custom.saturation and opts.colors.custom.saturation ~= "" then
        local s = tonumber(opts.colors.custom.saturation)
        if
          not s
          or s < M.valid_options.custom_ranges.saturation.min
          or s > M.valid_options.custom_ranges.saturation.max
        then
          return false,
            string.format(
              "Invalid saturation value: %s (must be between %d and %d)",
              opts.colors.custom.saturation,
              M.valid_options.custom_ranges.saturation.min,
              M.valid_options.custom_ranges.saturation.max
            )
        end
      end
      if opts.colors.custom.light and opts.colors.custom.light ~= "" then
        local l = tonumber(opts.colors.custom.light)
        if
          not l
          or l < M.valid_options.custom_ranges.light.min
          or l > M.valid_options.custom_ranges.light.max
        then
          return false,
            string.format(
              "Invalid light value: %s (must be between %d and %d)",
              opts.colors.custom.light,
              M.valid_options.custom_ranges.light.min,
              M.valid_options.custom_ranges.light.max
            )
        end
      end
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
