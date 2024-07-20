package.path = package.path .. ";../../?.lua;"

local flow_colors = require("flow.colors")
local util = require("flow.util")
local palette = flow_colors.setup()

local extras = {
  alacritty = { name = "alacritty", extension = "toml" },
  tmux = { name = "tmux", extension = "conf" },
  fzf = { name = "fzf", extension = "sh" },
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

local r, g, b = util.hsl_to_rbg(205, 80, 70)
local hex = util.rgb_to_hex(r, g, b)
print(r)
print(g)
print(b)
print(hex)
