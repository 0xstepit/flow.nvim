local M = {}

M.name = "flow"

function M.merge(left, right)
  for k, v in pairs(right) do
    left[k] = v
  end
  return left
end

function M.autocmds(config)
  local group = vim.api.nvim_create_augroup("flow", { clear = true })

  vim.api.nvim_create_autocmd("ColorSchemePre", {
    group = group,
    callback = function()
      vim.api.nvim_del_augroup_by_id(group)
    end,
  })
  local function set_whl()
    local win = vim.api.nvim_get_current_win()
    local whl = vim.split(vim.wo[win].winhighlight, ",")
    vim.list_extend(whl, { "Normal:NormalSB", "SignColumn:SignColumnSB" })
    whl = vim.tbl_filter(function(hl)
      return hl ~= ""
    end, whl)
    vim.opt_local.winhighlight = table.concat(whl, ",")
  end

  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    callback = set_whl,
  })
end

function M.terminal(colors)
  -- dark
  vim.g.terminal_color_0 = colors.black
  vim.g.terminal_color_8 = colors.terminal_black

  -- light
  vim.g.terminal_color_7 = colors.fg_dark
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
-- @param string The input string containing placeholders in the form ${variable_name}.
-- @param colors A table mapping variable names to their corresponding HEX values.
-- @return A new string with all placeholders replaced by their corresponding values from the colors table.
function M.interpolate(string, colors)
  return (
    string:gsub("($%b{})", function(w)
      -- access the colors table with what is between "${" and "}".
      -- TODO: add string split to access multiple levels.
      return colors[w:sub(3, -2)] or w
    end)
  )
end

return M
