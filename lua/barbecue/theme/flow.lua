local options = require("flow.config").options
local c = require("flow.colors").setup(options)

local M = {
  normal = { bg = c.none, fg = c.grey[4] },

  ellipsis = { fg = c.fg_gutter },
  separator = { fg = c.fg_gutter },
  modified = { fg = c.yellow },

  dirname = { fg = c.comment },
  basename = { fg = c.light_blue },
  context = { fg = c.grey[6] },

  context_object = { fg = c.cyan },
  context_class = { fg = c.cyan },
  context_struct = { fg = c.cyan },

  context_enum = { fg = c.purple },
  context_interface = { fg = c.purple },
  context_array = { fg = c.purple },
  context_event = { fg = c.yellow },
  context_number = { fg = c.yellow },
  context_boolean = { link = "Number" },
  context_file = { link = "Directory" },
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
  context_string = { link = "String" },
  context_key = { fg = c.purple },
  context_null = { fg = c.blue },
  context_enum_member = { fg = c.green },
  context_operator = { fg = c.green },
  context_type_parameter = { fg = c.purple },
}

return M
