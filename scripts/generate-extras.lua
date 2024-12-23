#!/usr/bin/env lua

-- CONTRACT: this file has to be called from the root of the project.
-- Add ../lua to the lua package path.
package.path = "./lua/?.lua;./lua/?/init.lua;" .. package.path

local function print_usage()
  print([[
Usage: generate-extras [options]

Options:
  all                     Generate all themes and colors
  dark [color]           Generate dark themes (optionally with specific color)
  light [color]          Generate light themes (optionally with specific color)
  
Available colors: pink, yellow, green, orange, cyan

Examples:
  generate-extras all
  generate-extras dark
  generate-extras dark yellow
]])
end

local args = { ... }
if #args == 0 then
  print_usage()
  os.exit(1)
end

local command = args[1]

local extra = require("flow.extra")

local status, err = pcall(function()
  if command == "all" then
    extra.generate_all()
  elseif command == "dark" or command == "light" then
    if #args == 2 then
      print_usage()
      os.exit(1)
    end

    local color = args[2]
    extra.generate(command, color)
  else
    print("Invalid command: " .. command)
    print_usage()
    os.exit(1)
  end
end)

if not status then
  print("Error: " .. err)
  os.exit(1)
end
