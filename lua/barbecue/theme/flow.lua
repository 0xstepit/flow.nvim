local options = require("flow.config").options
local c = require("flow.colors").setup(options)

local M = {
  normal = { bg = c.none, fg = c.fg_dark },

  ellipsis = { fg = c.to_check },
  separator = { fg = c.fg_gutter },
  modified = { fg = c.yellow },

  dirname = { fg = c.comment },
  basename = { fg = c.light_blue, bold = true },
  context = { fg = c.fg_dark },

  context_enum = { fg = c.orange },
  context_interface = { fg = c.orange },
  context_number = { fg = c.orange },
  context_boolean = { fg = c.orange },
  context_array = { fg = c.orange },
  context_event = { fg = c.orange },
  context_object = { fg = c.cyan },
  context_class = { link = "context_object" },
  context_struct = { link = "context_object" },
  context_file = { fg = c.to_check },
  context_module = { fg = c.yellow },
  context_namespace = { fg = c.yellow },
  context_package = { fg = c.blue },
  context_method = { fg = c.blue },
  context_property = { fg = c.green },
  context_field = { fg = c.green },
  context_constructor = { fg = c.blue },
  context_function = { fg = c.blue },
  context_variable = { fg = c.purple },
  context_constant = { fg = c.purple },
  context_string = { fg = c.green },
  context_key = { fg = c.purple },
  context_null = { fg = c.blue },
  context_enum_member = { fg = c.green },
  context_operator = { fg = c.green },
  context_type_parameter = { fg = c.green },
}

return M
