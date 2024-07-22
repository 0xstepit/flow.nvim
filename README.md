# 🌊 Flow

![logo](./assets/flow-logo.png) 

Flow is an [Nvim](https://github.com/neovim/neovim) color scheme designed for transparent or dark backgrounds. It features
carefully designed colors to help focusing during coding plus fluorescent details to provide a vibrant environment. Why fluo? Because it is
cool!

## Showcase

![terminal](./assets/flow-single-terminal.png) 

![terminals](./assets/flow-multiple-terminals.png)

# Palette

Flow has been designed using a palette based on nine colors selected through the HSL representation to
create a cohesive ambiance. The principal color is light blue, and the additional colors have been chosen
as follows:

- **Analogous** (S+/-30): blue, cyan.

- **Complementary** (S+/-180): orange.

- **Tetradic** 60 (S+/-60): purple, green.

- **Slit comp** (S+/-150): yellow, red.

Furthermore, teal has been included to enhance the blue tones, and a fluorescent color has been added for
striking accents. The palette is defined across three different levels of light:

|Bright|Normal|Dim|
|-|-|-|
|80|70|30|

![palette](./assets/flow-palette.png) 


# Requirements

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

# Usage

## [Lua](https://www.lua.org)

```lua
require("flow").setup{}
vim.cmd "colorscheme flow"
```

# Configuration

## Default

The configuration allows to specify 4 different options:

```lua 
return {
  "0xstepit/flow.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("flow").setup{
      transparent = false, -- Set transparent background.
      fluo_color = "pink", --  Fluo color: pink, yellow, orange, or green.
      mode = "normal", -- Intensity of the palette: normal, bright, desaturate, or dark. Notice that dark is ugly!
      aggressive_spell = false, -- Display colors for spell check.
    }

    vim.cmd "colorscheme flow"
  end,
}
```

## Suggested

<details>
<summary>My favorite config</summary>

```lua
return {
  "0xstepit/flow.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("flow").setup{
      transparent = true,
      fluo_color = "pink",
      mode = "normal",
      aggressive_spell = false,
    }
    vim.cmd "colorscheme flow"
  end,
}
```
</details>


# Supported plugins

Below the list of supported plugins divided by category:

- **Git**: [fugitive](https://github.com/tpope/vim-fugitive), [gitsign](https://github.com/lewis6991/gitsigns.nvim).

- **Completion**: [nvim-cmp](https://github.com/hrsh7th/nvim-cmp), [lsp-kind](https://github.com/onsails/lspkind.nvim).

- **Debug**: [nvim-dap](https://github.com/mfussenegger/nvim-dap).

- **Plugins**: [lazy](https://github.com/folke/lazy.nvim).

- **Coding**: [telescope](https://github.com/nvim-telescope/telescope.nvim), [treesitter](https://github.com/nvim-treesitter/nvim-treesitter).

- **Utils**: [trouble](https://github.com/folke/trouble.nvim), [todo-comments](https://github.com/folke/todo-comments.nvim), [which-key](https://github.com/folke/which-key.nvim).

- **Base Nvim**: diagnostic, lsp, markdown.

# Extras

Flow.nvim provides colorschemes also for the following tools:

- [Tmux](https://github.com/tmux/tmux/wiki) at [tmux-flow.conf](./extra/tmux-flow.conf).

- [Alacritty](https://alacritty.org/) at [alacritty-flow.toml](./extra/alacritty-flow.toml).

- [fzf](https://github.com/junegunn/fzf) at [fzf-flow.sh](./extra/fzf-flow.sh).

# Todo

This is still an ongoing project. Below are the next topics I will work on:

- [ ] Add docs.

- [ ] Extra automatic generation.

# Contributing

Pull requests and improvement suggestions are very welcome!

# References

My dot config [0xstepit/dotfiles](https://github.com/0xstepit/dotfiles).

This colorscheme is inspired by other amazing colorscheme:

- [Tokyo Night](https://github.com/folke/tokyonight.nvim)

- [Nordic](https://github.com/AlexvZyl/nordic.nvim)


