local M = {}

function M.generate_all()
  print("Generating all themes and colors")
  require("flow.extra.main").generate_all()
end

-- Allow generating specific theme/color combination
function M.generate(theme_type, fluo_color)
  require("flow.extra.main").generate(theme_type, fluo_color)
end

return M
