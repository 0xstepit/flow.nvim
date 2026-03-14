--- Stores allowed values for configuration options.
--- @class ConfigEnum
--- @field name string The name of the enum.
--- @field path string[] The path to get the enum field in the config.
--- @field valid string[] Valid values.

local M = {
  --- ConfigEnum[]
  enum_values = {
    { name = "style", path = { "theme", "style" }, valid = { "dark", "light" } },
    {
      name = "contrast",
      path = { "theme", "contrast" },
      valid = { "default", "high" },
    },
    { name = "mode", path = { "colors", "mode" }, valid = { "default", "dark", "light" } },
    {
      path = { "colors", "fluo" },
      valid = { "pink", "cyan", "yellow", "orange", "green" },
      name = "fluo color",
    },
    {
      name = "borders",
      path = { "ui", "borders" },
      valid = { "light", "dark", "none" },
    },
  },
}

--- Default configuration options for the colorscheme.
--- @class FlowConfig
M.defaults = {
  --- @class FlowThemeConfig
  --- @field style "dark" | "light" Defines the colorscheme theme style.
  --- @field contrast "default" | "high" Defines whether details contrasts should be accentuated or not.
  --- @field transparent boolean Defines whether neovim background should be transparent (fallback to terminal value) or not.
  theme = {
    style = "dark",
    contrast = "default",
    transparent = false,
  },
  --- @class FlowColorsConfig
  --- @field mode "default" | "dark" | "light" Defines the colors used in the syntax and UI.
  --- @field fluo "pink" | "cyan" | "yellow" | "orange" | "green" Fluo color used in the theme.
  --- @field custom { saturation: string, lightness: string } Allows to specify custom saturation
  --- (0, 100) and lightness (0, 100) for theme. Despite the option is present for maximum
  --- customizability, it is recommended to use defaults.
  colors = {
    mode = "default",
    fluo = "pink",
    custom = { saturation = "", lightness = "" },
  },
  --- @class FlowUiConfig
  --- @field borders "light" | "dark" | "none" Defines how borders of elements are displayed.
  --- @field aggressive_spell boolean Defines if spell errors have to be highlighted with
  --- a more outstanding color.
  --- @field aggressive_special_comment boolean Defines if special comments (TODO, FIX, etc.)
  --- has to be highlighted with different colors.
  ui = {
    borders = "none",
    aggressive_spell = false,
    aggressive_special_comment = false,
  },
}

--- Used to store colorscheme configuration with user provided custom values.
--- @type FlowConfig
M.options = {}

--- Validate configuration options.
--- @param config FlowConfig
--- @return boolean, string?
function M.validate_options(config)
  for _, v in ipairs(M.enum_values) do
    local val = config
    for _, key in ipairs(v.path) do
      val = val and val[key]
    end
    if val and not vim.tbl_contains(v.valid, val) then
      return false, string.format("Invalid %s: %s", v.name, val)
    end
  end

  -- Validate custom color values for hue and light.
  if config.colors and config.colors.custom then
    local sl = { saturation = { 0, 100 }, lightness = { 0, 100 } }
    for property, range in pairs(sl) do
      local min, max = range[1], range[2]

      local custom_val = config.colors.custom[property]
      if custom_val and custom_val ~= "" then
        local val = tonumber(custom_val)
        if not val or val < min or val > max then
          return false,
            string.format(
              "Invalid %s value: %s (must be between %d and %d)",
              property,
              custom_val,
              min,
              max
            )
        end
      end
    end
  end

  return true
end

--- This is the entry point of the configuration before loading the plugin.
--- It sets the colorscheme options by merging the user provided ones with
--- the default configuration.
--- @param config FlowConfig? Optional table to customize the colorscheme configuration.
function M._setup(config)
  -- Short circuit if options have been already set. This happen when the colorscheme is loaded from
  -- the plugin manager because it first set the options, and then set the colorscheme.
  if not vim.tbl_isempty(M.options) then
    return
  end

  if config then
    local ok, err = M.validate_options(config)
    if not ok then
      config = {}
    end
  end

  -- Set to the table the default config updated with the user provided one.
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, config or {})
end

return M
