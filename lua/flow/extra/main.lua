package.path = package.path .. ";../../?.lua;"

local config = require("config")
local flow_colors = require("flow.colors")

local fluo_colors = { "pink", "yellow", "green", "orange", "cyan" }

local extras = {
  alacritty = { name = "alacritty", extension = "toml" },
  tmux = { name = "tmux", extension = "conf" },
  fzf = { name = "fzf", extension = "sh" },
  kitty = { name = "kitty", extension = "conf" },
}

local function create_folder_if_not_exists(path)
  local folder = io.open(path, "r")
  if folder then
    folder:close()
  else
    os.execute("mkdir -p " .. path)
  end
end

local function generate_extras(theme, fluo_color)
  local palette = flow_colors.setup(theme)

  local theme_folder = "../../../extra/" .. theme.name
  for _, e in pairs(extras) do
    local template = require(e.name)
    local colorscheme = template.generate(palette)

    create_folder_if_not_exists(theme_folder)

    local filename = e.name .. "-flow-" .. fluo_color
    local file = io.open(theme_folder .. "/" .. filename .. "." .. e.extension, "w")
    -- Write the formatted string to the file
    if file then
      file:write(colorscheme)
      file:close()
    else
      print("error: could not open file for writing")
    end
  end
end

for _, fc in pairs(fluo_colors) do
  -- Generate dark theme extras
  local config_dark = config.get_dark_theme(fc)
  for _, theme in pairs(config_dark) do
    generate_extras(theme, fc)
  end

  -- TODO: not very happy with the light colorscheme.
  -- -- Generate light theme extras
  -- local config_light = config.get_light_theme(fc)
  -- for _, theme in pairs(config_light) do
  --   generate_extras(theme, fc)
  -- end
end
