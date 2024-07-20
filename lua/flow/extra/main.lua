package.path = package.path .. ";../../?.lua;"

local flow_colors = require("flow.colors")
local palette = flow_colors.setup()

local extras = {
  alacritty = { name = "alacritty", extension = "toml" },
  tmux = { name = "tmux", extension = "conf" },
  fzf = { name = "fzf", extension = "sh" },
}

for _, e in pairs(extras) do
  print("hello")
  local template = require(e.name)
  local colorscheme = template.generate(palette)

  local file = io.open("../../../extra/" .. e.name .. "-flow." .. e.extension, "w")
  print(file)
  -- Write the formatted string to the file
  if file then
    file:write(colorscheme)
    file:close()
  else
    print("error: could not open file for writing")
  end
end
