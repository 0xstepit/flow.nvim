local M = {}

local defaults = {
  transparent = false, -- Set transparent background.
  fluo_color = "pink", --  Fluo color: pink, yellow, orange, or green.
  mode = "normal", -- Intensity of the palette: normal, dark, or bright. Notice that dark is ugly!
  aggressive_spell = false, -- Display colors for spell check.
}

M.options = defaults

-- This is the entry point of the configuration before loading the plugin.
function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, M.options or defaults, options or {})
end

return M
