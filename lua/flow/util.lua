local M = {}

M.name = "flow"

function M.merge(left, right)
  for k, v in pairs(right) do
    left[k] = v
  end
  return left
end

function M.hsl_to_hex(h, s, l)
  local r, g, b = M.hsl_to_rbg(h, s, l)
  return M.rgb_to_hex(r, g, b)
end

function M.rgb_to_hex(r, g, b)
  local rx = string.format("%02x", r)
  local gx = string.format("%02x", g)
  local bx = string.format("%02x", b)
  return string.format("#%s%s%s", rx, gx, bx)
end

function M.hsl_to_rbg(h, s, l)
  h = h / 360
  s = s / 100
  l = l / 100

  local r, g, b

  if s == 0 then
    r, g, b = l, l, l -- achromatic
  else
    local function hue_to_rgb(p, q, t)
      if t < 0 then
        t = t + 1
      end
      if t > 1 then
        t = t - 1
      end
      if t < 1 / 6 then
        return p + (q - p) * 6 * t
      end
      if t < 1 / 2 then
        return q
      end
      if t < 2 / 3 then
        return p + (q - p) * (2 / 3 - t) * 6
      end
      return p
    end

    local q = l < 0.5 and l * (1 + s) or l + s - l * s
    local p = 2 * l - q
    r = hue_to_rgb(p, q, h + 1 / 3)
    g = hue_to_rgb(p, q, h)
    b = hue_to_rgb(p, q, h - 1 / 3)
  end

  return math.floor(0.5 + r * 255), math.floor(0.5 + g * 255), math.floor(0.5 + b * 255)
end

-- TODO: complete
function M.terminal(colors)
  -- dark
  vim.g.terminal_color_0 = colors.black
  vim.g.terminal_color_8 = colors.terminal_black

  -- light
  vim.g.terminal_color_7 = colors.terminal_white
  vim.g.terminal_color_15 = colors.fg

  -- colors
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_9 = colors.red

  vim.g.terminal_color_2 = colors.cyan
  vim.g.terminal_color_10 = colors.cyan

  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_11 = colors.yellow

  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_12 = colors.blue

  vim.g.terminal_color_5 = colors.purple
  vim.g.terminal_color_13 = colors.purple

  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_14 = colors.cyan
end

--- Interpolates a string by replacing placeholders with corresponding values from a table.
--- @param file string The input string containing placeholders in the form ${variable_name}.
--- @param colors table A table mapping variable names to their corresponding HEX values.
--- @return string A new string with all placeholders replaced by their corresponding values from the colors table.
function M.interpolate(file, colors)
  return (
    file:gsub("($%b{})", function(w)
      -- access the colors table with what is between "${" and "}".
      -- TODO: add string split to access multiple levels.
      return colors[w:sub(3, -2)] or w
    end)
  )
end

return M
