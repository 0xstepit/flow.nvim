local colors = require("flow.colors").colors
local is_mono = vim.g.colors_name == "flow-mono"

local flow = {}

if is_mono then
  -- Monochrome: grey backgrounds, fluo for active mode indicator.
  -- All vim modes shares the same colors.
  local grey_a = { bg = colors.grey[6], fg = colors.bg_highlight }
  local grey_b = { bg = colors.bg_highlight, fg = colors.grey[6] }
  local fluo_a = { bg = colors.fluo, fg = colors.bg_highlight }

  flow.normal = {
    a = fluo_a,
    b = grey_b,
    c = { bg = colors.bg_statusline, fg = colors.fg_statusline },
  }
  flow.insert = { a = grey_a, b = grey_b }
  flow.command = { a = grey_a, b = grey_b }
  flow.visual = { a = grey_a, b = grey_b }
  flow.replace = { a = grey_a, b = grey_b }
  flow.terminal = { a = grey_a, b = grey_b }
  flow.inactive = {
    c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
  }
else
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
end

return flow
