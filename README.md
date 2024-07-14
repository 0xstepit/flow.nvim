# 🌊 Flow

![logo](./assets/logo.png) 

Flow is an [Nvim](https://github.com/neovim/neovim) color scheme designed for transparent or dark backgrounds. It features
carefully designed colors to help focusing during coding plus fluorescent details. Why fluo? Because it is
nice!

## Requirements

- [Neovim](https://github.com/neovim/neovim) >=
  [0.8.0](https://github.com/neovim/neovim/releases/tag/v0.8.0)

## Installation

Install the theme with your preferred package manager, such as
[folke/lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "0xstepit/flow.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}
```

## Usage

### [Lua](https://www.lua.org)

```lua
require("flow").setup {}
vim.cmd "colorscheme flow"
```

## Configuration

> ❗️ Set the configuration **BEFORE** loading the color scheme with `colorscheme flow`.

### Example configuration

```lua 
return {
  "0xstepit/flow.nvim",
  name = "Flow",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("flow").setup {
      transparent = true,
      brighter = true,
      fluo_color = "yellow"
    }

    vim.cmd "colorscheme flow"
  end,
}
```

## Todo

This is still an ongoing project. Below are the next topics I will work on:

- [ ] Add missing major plugins.
- [ ] Add docs.
- [ ] Improve readme.
- [ ] Fix extra automatic generation.

## Contributing

Pull requests are welcome.

## References

This colorscheme is inspired by the amazing [Tokyo Night](https://github.com/folke/tokyonight.nvim) plugin.

