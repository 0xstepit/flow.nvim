local config = require("flow.extra.config")
local flow_colors = require("flow.colors")

local M = {}

local fluo_colors = { "pink", "yellow", "green", "orange", "cyan" }

local template_path = "flow.extra.template"
local extras = {
  alacritty = { name = template_path .. ".alacritty", extension = "toml" },
  tmux = { name = template_path .. ".tmux", extension = "conf" },
  fzf = { name = template_path .. ".fzf", extension = "sh" },
  kitty = { name = template_path .. ".kitty", extension = "conf" },
  ghostty = { name = template_path .. ".ghostty", extension = "config" },
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
  local palette = flow_colors.setup(theme.config)

  -- theme_folder defines where the extra themes will be saved.
  -- It is relative to the root of the project.
  local theme_folder = "./extra/" .. theme.name
  for template_name, template_info in pairs(extras) do
    local template = require(template_info.name)
    local colorscheme = template.generate(palette)

    create_folder_if_not_exists(theme_folder)

    local filename = template_name .. "-flow-" .. fluo_color
    local filepath = theme_folder .. "/" .. filename .. "." .. template_info.extension

    local file = io.open(filepath, "w")
    if file then
      file:write(colorscheme)
      file:close()
      print(
        string.format(
          "Generated %s template for %s theme with %s accent",
          template_name,
          theme.name,
          fluo_color
        )
      )
    else
      print("Error: could not write to file: %s", filepath)
    end
  end
end

function M.generate(theme_type, fluo_color)
  if theme_type ~= "dark" and theme_type ~= "light" then
    error("Theme type must be 'dark' or 'light'")
  end

  if fluo_color and not vim.tbl_contains(fluo_colors, fluo_color) then
    error("Invalid fluo_color. Must be one of: " .. table.concat(fluo_colors, ", "))
  end

  local colors_to_generate = fluo_color and { fluo_color } or fluo_colors

  for _, fc in ipairs(colors_to_generate) do
    local themes = theme_type == "dark" and config.get_dark_themes(fc)
      or config.get_light_themes(fc)

    for _, theme in pairs(themes) do
      generate_extras(theme, fc)
    end
  end
end

function M.generate_all()
  M.generate("dark")
  M.generate("light")
end

return M
