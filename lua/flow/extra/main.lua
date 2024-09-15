package.path = package.path .. ";../../?.lua;"

local flow_colors = require("flow.colors")
local opts = {
  light_theme = false,
  transparent = false,
  fluo_color = "pink",
  mode = "desaturate",
  aggressive_spell = false,
}
local palette = flow_colors.setup(opts)

local extras = {
  alacritty = { name = "alacritty", extension = "toml" },
  tmux = { name = "tmux", extension = "conf" },
  fzf = { name = "fzf", extension = "sh" },
  kitty = { name = "kitty", extension = "conf" }
}

for _, e in pairs(extras) do
  local template = require(e.name)
  local colorscheme = template.generate(palette)

  local file = io.open("../../../extra/" .. e.name .. "-flow." .. e.extension, "w")
  -- Write the formatted string to the file
  if file then
    file:write(colorscheme)
    file:close()
  else
    print("error: could not open file for writing")
  end
end
