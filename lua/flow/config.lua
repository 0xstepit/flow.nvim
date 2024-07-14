local M = {}

local defaults = {
  transparent = false, -- Set transparent background for the theme.
  fluo_color = "pink",
  brighter = false,
  styles = {
    comments = { italic = false, bold = false, underline = false },
    keywords = { italic = false, bold = false, underline = false },
    functions = { italic = false, bold = false, underline = false },
    variables = { italic = false, bold = false, underline = false },
  },

  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`

  on_colors = function(colors) end, -- luacheck: ignore 211
}

M.options = nil

-- This is the entry point of the configuration before loading the plugin.
function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end

-- Set the colorscheme options overriding default ones with user defined.
function M.extend(options)
  return M.options
end

-- -- Executed when the file is loaded.
-- M.setup()

return M
