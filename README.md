# 🌊 Flow

![logo](https://github.com/user-attachments/assets/d4a06c71-4f1b-4375-969a-77f8d30b1fb5)

Flow is an [Nvim](https://github.com/neovim/neovim) color scheme written in
[Lua](https://www.lua.org/). It features a carefully curated palette to enhance
focus during coding, complemented by fluorescent accents for a vibrant and dynamic look.

Why fluo? Because it's simply cool!

## Showcase

![flow-single-terminal](https://github.com/user-attachments/assets/36f1fb1b-c4c1-41c3-910b-e0d0de4d1bfe)

![flow-multiple-terminal](https://github.com/user-attachments/assets/9d1f367a-7a9d-478d-9fe0-a67bd33eca1a)

## Palette

Flow uses a palette of nine HSL-based colors, chosen to create a cohesive and visually appealing
environment. The primary color is light blue, with supporting tones selected as follows based on
the saturation value:

- **Analogous** (±30°): blue, cyan.

- **Complementary** (±180°): orange.

- **Tetradic** 60 (±60°): purple, green.

- **Split comp** (±150°): yellow, red.

Additionally, sky blue enhances the blue tones, and a fluorescent color provides striking accents.

## Requirements

- [Neovim](https://github.com/neovim/neovim) >=
  [0.8.0](https://github.com/neovim/neovim/releases/tag/v0.8.0)

## Installation

Install Flow with your preferred package manager, such as
[folke/lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "0xstepit/flow.nvim",
  lazy = false,
  priority = 1000,
  tag = "vX.0.0",
  opts = {
        -- Your configuration options here.
    },
}
```

> Use the tag field to prevent breaking changes from automatic updates.

## Usage

### Lua

Setup and start using Flow with default options:

```lua
require("flow").setup{}
vim.cmd "colorscheme flow"
```

## Configuration

The following section describes how to configure the plugin using Lazy plugin manager.

### Default

```lua
return {
  "0xstepit/flow.nvim",
  lazy = false,
  priority = 1000,
  tag = "v1.0.0",
    opts = {
      theme = {
        style = "dark", --  "dark" | "light"
        contrast = "default", -- "default" | "high"
        transparent = false, -- true | false
      },
      colors = {
        mode = "default", -- "default" | "dark" | "light"
        fluo = "pink", -- "pink" | "cyan" | "yellow" | "orange" | "green"
        custom = {
          saturation = "", -- "" | string representing an integer between 0 and 100
          light = "", -- "" | string representing an integer between 0 and 100
        },
      },
      ui = {
        borders = "inverse", -- "theme" | "inverse" | "fluo" | "none"
        aggressive_spell = false, -- true | false
      },
    },
    config = function(_, opts)
      require("flow").setup(opts)
      vim.cmd("colorscheme flow")
    end,
  },
}
```

Keep in mind that the `transparent` flag sets the background of neovim transparent and, as a
result, the terminal emulator background will be visible. It is suggested to always add some bluur
to the terminal emulator when the background is transparent.

## Supported plugins

Below the list of supported plugins divided by category:

- **Git**: [fugitive](https://github.com/tpope/vim-fugitive), [gitsign](https://github.com/lewis6991/gitsigns.nvim).

- **Completion**: [nvim-cmp](https://github.com/hrsh7th/nvim-cmp), [lsp-kind](https://github.com/onsails/lspkind.nvim).

- **Debug**: [nvim-dap](https://github.com/mfussenegger/nvim-dap).

- **Plugins & Utils**: [lazy](https://github.com/folke/lazy.nvim),
  [mason](https://github.com/williamboman/mason.nvim)

- **Coding**: [telescope](https://github.com/nvim-telescope/telescope.nvim),
  [treesitter](https://github.com/nvim-treesitter/nvim-treesitter),
  [ibl](https://github.com/lukas-reineke/indent-blankline.nvim),
  [oil](https://github.com/stevearc/oil.nvim)

- **AI**: [avante](https://github.com/yetone/avante.nvim)

- **Utils**: [trouble](https://github.com/folke/trouble.nvim),
  [todo-comments](https://github.com/folke/todo-comments.nvim),
  [which-key](https://github.com/folke/which-key.nvim),
  [render-markdwon](https://github.com/MeanderingProgrammer/render-markdown.nvim),
  [mini-hipatterns](https://github.com/echasnovski/mini.hipatterns)

- **Base Nvim**: diagnostic, lsp, markdown.

## Extras

Flow.nvim provides colorschemes also for the following tools:

- [Tmux](https://github.com/tmux/tmux/wiki) at [tmux-flow.conf](./extra/eclipse/tmux-flow-pink.conf).

- [Alacritty](https://alacritty.org/) at [alacritty-flow.toml](./extra/eclipse/alacritty-flow-pink.toml).

- [Kitty](https://sw.kovidgoyal.net/kitty/) at [kitty-flow.conf](./extra/eclipse/kitty-flow-pink.conf).

- [fzf](https://github.com/junegunn/fzf) at [fzf-flow.sh](./extra/eclipse/fzf-flow-pink.sh).

- [ghostty](https://github.com/ghostty-org/ghostty) at [ghostty-flow.config](./extra/eclipse/ghostty-flow-pink.config).

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
