local colors = require("flow.colors").colors

local flow = {}

-- Normal mode colors. a will be used also for x,
-- b for y, and c for z to have a symmetrical coloration.
flow.normal = {
  a = { bg = colors.light_blue, fg = colors.bg_highlight },
  b = { bg = colors.bg_highlight, fg = colors.light_blue },
  c = { bg = colors.bg_statusline, fg = colors.fg_statusline },
}

-- Insert mode colors. a will be used also for x,
-- b for y, and c for z to have a symmetrical coloration.
flow.insert = {
  a = { bg = colors.cyan, fg = colors.bg_highlight },
  b = { bg = colors.bg_highlight, fg = colors.cyan },
}

-- Command mode colors. a will be used also for x,
-- b for y, and c for z to have a symmetrical coloration.
flow.command = {
  a = { bg = colors.yellow, fg = colors.bg_highlight },
  b = { bg = colors.bg_highlight, fg = colors.yellow },
}

-- Visual mode colors. a will be used also for x,
-- b for y, and c for z to have a symmetrical coloration.
flow.visual = {
  a = { bg = colors.purple, fg = colors.bg_highlight },
  b = { bg = colors.bg_highlight, fg = colors.purple },
}

-- Replace mode colors. a will be used also for x,
-- b for y, and c for z to have a symmetrical coloration.
flow.replace = {
  a = { bg = colors.red, fg = colors.bg_highlight },
  b = { bg = colors.bg_highlight, fg = colors.red },
}

-- Terminal mode colors. a will be used also for x,
-- b for y, and c for z to have a symmetrical coloration.
flow.terminal = {
  a = { bg = colors.green, fg = colors.bg_highlight },
  b = { bg = colors.bg_highlight, fg = colors.green },
}

-- Inactive mode colors. Only c seems to be applied here
flow.inactive = {
  c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
}

return flow
