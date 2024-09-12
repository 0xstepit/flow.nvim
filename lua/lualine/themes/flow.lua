local colors = require("flow.colors").colors

local flow = {}

-- Normal mode colors. a will be used also for x,
-- b for y, and c for z to have a symmetrical coloration.
flow.normal = {
  a = { bg = colors.light_blue, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.light_blue },
  c = { bg = colors.bg_statusline, fg = colors.fg_statusline },
}

-- Insert mode colors. a will be used also for x,
-- b for y, and c for z to have a symmetrical coloration.
flow.insert = {
  a = { bg = colors.cyan, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.cyan },
}

-- Command mode colors. a will be used also for x,
-- b for y, and c for z to have a symmetrical coloration.
flow.command = {
  a = { bg = colors.teal, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.sky_blue },
}

-- Visual mode colors. a will be used also for x,
-- b for y, and c for z to have a symmetrical coloration.
flow.visual = {
  a = { bg = colors.purple, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.purple },
}

-- Replace mode colors. a will be used also for x,
-- b for y, and c for z to have a symmetrical coloration.
flow.replace = {
  a = { bg = colors.red, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.red },
}

-- Terminal mode colors. a will be used also for x,
-- b for y, and c for z to have a symmetrical coloration.
flow.terminal = {
  a = { bg = colors.green, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.green },
}

-- Inactive mode colors. Only c seems to be applied here
flow.inactive = {
  c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
}

return flow
