local M = {}

--- Default configuration options for the colorscheme.
--- @class FlowConfig
M.defaults = {
  theme = {
    --- Defines the colorscheme theme style.
    --- @type "dark" | "light"
    style = "dark",
    --- Defines whether details contrasts should be accentuated or not.
    --- @type "default" | "high"
    contrast = "default",
    --- @boolean
    transparent = false,
    --- @boolean Internal flag set by flow-mono entry point
    mono = false,
  },
  colors = {
    --- Defines the colors used in the syntax and UI.
    ---@type "default" | "dark" | "light"
    mode = "default",
    --- Fluo color to use in the theme.
    ---@type "pink" | "cyan" | "yellow" | "orange" | "green"
    fluo = "pink",
    --- Allows to specify custom saturation and light for theme. Despite the option is present for
    --- maximum customizability, it is recommended to use defaults.
    custom = {
      --- A number between 0-100 as string or empty string.
      --- @type string
      saturation = "",
      --- A number between 0-100 as string or empty string.
      --- @type string
      light = "",
    },
  },
  ui = {
    --- @type "light" | "dark" | "none"
    borders = "dark",
    --- Defines if spell errors have to be highlighted with a more outstanding color.
    --- @boolean
    aggressive_spell = false,
    --- Defines if special comments (TODO, FIX, etc.) has to be highlighted with different colors.
    --- @boolean
    aggressive_special_comment = false,
  },
}

--- @type FlowConfig
M.options = {}

--- Valid values for configuration options.
M.valid_options = {
  fluo_colors = { "pink", "cyan", "yellow", "orange", "green" },
  modes = { "default", "dark", "light" },
  borders = { "light", "dark", "none" },
  contrast = { "default", "high" },
  custom_ranges = {
    saturation = { min = 0, max = 100 },
    light = { min = 0, max = 100 },
  },
}

--- Validate configuration options.
--- @param config FlowConfig
--- @return boolean, string?
local function validate_options(config)
  -- Validate theme options.
  if config.theme then
    if
      config.theme.contrast
      and not vim.tbl_contains(M.valid_options.contrast, config.theme.contrast)
    then
      return false, string.format("Invalid border: %s", config.theme.contrast)
    end
  end

  -- Validate color options.
  if config.colors then
    if
      config.colors.fluo and not vim.tbl_contains(M.valid_options.fluo_colors, config.colors.fluo)
    then
      return false, string.format("Invalid fluo color: %s", config.colors.fluo)
    end

    if config.colors.mode and not vim.tbl_contains(M.valid_options.modes, config.colors.mode) then
      return false, string.format("Invalid mode: %s", config.colors.mode)
    end

    -- Validate custom color values for hue and light.
    if config.colors.custom then
      if config.colors.custom.saturation and config.colors.custom.saturation ~= "" then
        local s = tonumber(config.colors.custom.saturation)
        if
          not s
          or s < M.valid_options.custom_ranges.saturation.min
          or s > M.valid_options.custom_ranges.saturation.max
        then
          return false,
            string.format(
              "Invalid saturation value: %s (must be between %d and %d)",
              config.colors.custom.saturation,
              M.valid_options.custom_ranges.saturation.min,
              M.valid_options.custom_ranges.saturation.max
            )
        end
      end
      if config.colors.custom.light and config.colors.custom.light ~= "" then
        local l = tonumber(config.colors.custom.light)
        if
          not l
          or l < M.valid_options.custom_ranges.light.min
          or l > M.valid_options.custom_ranges.light.max
        then
          return false,
            string.format(
              "Invalid light value: %s (must be between %d and %d)",
              config.colors.custom.light,
              M.valid_options.custom_ranges.light.min,
              M.valid_options.custom_ranges.light.max
            )
        end
      end
    end
  end

  -- Validate UI options.
  if config.ui then
    if config.ui.borders and not vim.tbl_contains(M.valid_options.borders, config.ui.borders) then
      return false, string.format("Invalid border: %s", config.ui.borders)
    end
  end

  return true
end

--- This is the entry point of the configuration before loading the plugin.
--- It sets the colorscheme options by merging the user provided ones with
--- the default configuration.
--- @param config FlowConfig? Optional table to customize the colorscheme setup.
function M._setup(config)
  -- Short circuit if options have been already set. This happen when the colorscheme is loaded from
  -- the plugin manager because it first set the options, and then set the colorscheme.
  if not vim.tbl_isempty(M.options) then
    return
  end

  local ok, err = validate_options(config or {})
  if not ok then
    config = {}
    vim.notify("Error setting user options, fallback to defaults: " .. err, vim.log.levels.WARN)
  end

  M.options = vim.tbl_deep_extend("force", {}, M.defaults, config or {})
end

return M
