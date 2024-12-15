# 🌊 Flow

![logo](https://github.com/user-attachments/assets/d4a06c71-4f1b-4375-969a-77f8d30b1fb5)

Flow is an [Nvim](https://github.com/neovim/neovim) color scheme written in
[Lua](https://www.lua.org/). It features carefully designed colors to help
focusing during coding plus fluorescent details to provide a vibrant environment.

Why fluo? Because it's cool!

## Showcase

![flow-single-terminal](https://github.com/user-attachments/assets/36f1fb1b-c4c1-41c3-910b-e0d0de4d1bfe)

![flow-multiple-terminal](https://github.com/user-attachments/assets/9d1f367a-7a9d-478d-9fe0-a67bd33eca1a)

## Palette

Flow has been designed using a palette based on 9 colors selected through the HSL representation to
create a cohesive ambiance. The principal color is the light blue, and the additional colors have
been chosen as follows with minor changes have a more pleasant looking:

- **Analogous** (S+/-30): blue, cyan.

- **Complementary** (S+/-180): orange.

- **Tetradic** 60 (S+/-60): purple, green.

- **Split comp** (S+/-150): yellow, red.

Furthermore, sky blue has been included to enhance the blue tones, and a fluorescent color has been
added for striking accents.

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
  tag = "v1.0.0",
  opts = {
        -- Your configuration options here.
    },
}
```

Please, set the tag field if you don't want to automatically update the colorscheme introducing
breaking changes.

## Usage

### Lua

To install and start using the plugin with default options:

```lua
require("flow").setup{}
vim.cmd "colorscheme flow"
```

## Configuration

The following section describes as how to configure the plugin using Lazy plugin manager.

### Default

The configuration allows you to specify 5 different options:

```lua
return {
  "0xstepit/flow.nvim",
  lazy = false,
  priority = 1000,
  tag = "v1.0.0",
    opts = {
      dark_theme = true, -- true | false
      transparent = true, -- true | false
      high_contrast = false, -- true | false
      fluo_color = "pink", -- "pink" | "cyan" | "yellow" | "green" | "orange"
      mode = "default", -- "default" | "bright" | "dark"
      aggressive_spell = false, -- true | false
    },
    config = function(_, opts)
      require("flow").setup(opts)
      vim.cmd("colorscheme flow")
    end,
  },
}
```

Keep in mind that the `transparent` flags set the background of neovim transparent and, as a
result, the terminal emulator background will be visible. It is suggested to always add some bluur
to the terminal emulator when the background is transparent.

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
      dark_theme = true,
      transparent = true,
      high_contrast = false,
      fluo_color = "pink",
      mode = "default",
      aggressive_spell = false,
    }
    vim.cmd "colorscheme flow"
  end,
}
```

</details>

## Supported plugins

Below the list of supported plugins divided by category:

- **Git**: [fugitive](https://github.com/tpope/vim-fugitive), [gitsign](https://github.com/lewis6991/gitsigns.nvim).

- **Completion**: [nvim-cmp](https://github.com/hrsh7th/nvim-cmp), [lsp-kind](https://github.com/onsails/lspkind.nvim).

- **Debug**: [nvim-dap](https://github.com/mfussenegger/nvim-dap).

- **Plugins**: [lazy](https://github.com/folke/lazy.nvim).

- **Coding**: [telescope](https://github.com/nvim-telescope/telescope.nvim), [treesitter](https://github.com/nvim-treesitter/nvim-treesitter).

- **Utils**: [trouble](https://github.com/folke/trouble.nvim),
  [todo-comments](https://github.com/folke/todo-comments.nvim),
  [which-key](https://github.com/folke/which-key.nvim).

- **Base Nvim**: diagnostic, lsp, markdown.

## Extras

Flow.nvim provides colorschemes also for the following tools:

- [Tmux](https://github.com/tmux/tmux/wiki) at [tmux-flow.conf](./extra/tmux-flow.conf).

- [Alacritty](https://alacritty.org/) at [alacritty-flow.toml](./extra/alacritty-flow.toml).

- [Kitty](https://sw.kovidgoyal.net/kitty/) at [kitty-flow.conf](./extra/kitty-flow.conf).

- [fzf](https://github.com/junegunn/fzf) at [fzf-flow.sh](./extra/fzf-flow.sh).

To generate extra themes you can use the `Makefile`:

```sh
make extras
```

Now you can copy generated files at `./extras/` where your configuration is sourcing them.

## Contributing

Pull requests and improvement suggestions are very welcome! If you want to help
developing the plugin, please consider addressing one of the issue marked as
[`good-first-issue`](https://github.com/0xstepit/flow.nvim/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22).

Or create a PR with improvements you would like to see!

## Contributors

<p align="center">
    <a href="https://github.com/0xstepit/flow.nvim/graphs/contributors">
        <img src="https://contrib.rocks/image?repo=0xstepit/flow.nvim" />
    </a>
</p>

## References

My dotfile: [0xstepit/dotfiles](https://github.com/0xstepit/dotfiles).

This project is inspired by other amazing colorscheme:

- [Tokyo Night](https://github.com/folke/tokyonight.nvim)

- [Gruvbox](https://github.com/morhetz/gruvbox)

- [Nordic](https://github.com/AlexvZyl/nordic.nvim)
