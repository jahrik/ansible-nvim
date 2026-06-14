## NEOVIM

[![CICD](https://github.com/jahrik/ansible-nvim/actions/workflows/cicd.yml/badge.svg)](https://github.com/jahrik/ansible-nvim/actions/workflows/cicd.yml)

Installs [Neovim](https://neovim.io/) and deploys a full Lua-based configuration to `~/.config/nvim/`. Manages plugins with [lazy.nvim](https://github.com/folke/lazy.nvim), sets up LSP with Mason, and installs [DejaVu Sans Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts) for icon support.

## OS Support

| Platform | Install method |
|---|---|
| Arch Linux | `pacman` |
| Ubuntu / Debian | `apt` |
| macOS | Homebrew (`become: false` throughout) |
| Steam Deck / SteamOS | Static binaries to `~/.local/bin` — survives OS updates |

Steam Deck is detected automatically via `/etc/steamos-release`. Because SteamOS has a read-only root filesystem, all tools are installed to the user's home directory without `sudo`.

## Plugins

Plugin management uses [lazy.nvim](https://github.com/folke/lazy.nvim), which bootstraps itself on first launch and installs all plugins automatically.

### UI

| Plugin | Purpose |
|---|---|
| [nightfox.nvim](https://github.com/EdenEast/nightfox.nvim) | Colorscheme — configured with the `terafox` theme |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line, also using `terafox` theme |
| [barbar.nvim](https://github.com/romgrk/barbar.nvim) | Tab/buffer bar with file icons |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer sidebar |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File type icons (requires a Nerd Font) |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics list — shows LSP errors, warnings, and references |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Popup showing available keybindings as you type |

### Navigation and Search

| Plugin | Purpose |
|---|---|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder for files, grep, and buffers |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua utility library required by telescope |

Telescope keybindings (`<leader>` is `\` by default):

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | List open buffers |
| `<leader>fh` | Search help tags |

### LSP and Completion

| Plugin | Purpose |
|---|---|
| [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim) | Wires together nvim-lspconfig, mason, and nvim-cmp with sane defaults |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | GUI installer for LSP servers, linters, and formatters |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Bridges mason and lspconfig — auto-configures installed servers |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Community LSP server configurations |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | LSP completion source |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) | Buffer word completion source |
| [cmp-path](https://github.com/hrsh7th/cmp-path) | Filesystem path completion source |
| [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua) | Neovim Lua API completion source |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) | LuaSnip completion source for nvim-cmp |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Snippet collection for common languages |

LSP servers are installed interactively via `:Mason`. The `lua_ls` server is pre-configured with globals for `vim` and `love` (Love2D).

Completion mappings:

| Key | Action |
|---|---|
| `<CR>` | Confirm selection |
| `<C-Space>` | Trigger completion |
| `<Tab>` | Next snippet placeholder |
| `<S-Tab>` | Previous snippet placeholder |

### Syntax and Editing

| Plugin | Purpose |
|---|---|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Parser-based syntax highlighting and indentation |
| [filetype.nvim](https://github.com/nathom/filetype.nvim) | Fast filetype detection with custom overrides (Ansible YAML, Brewfiles, etc.) |
| [vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace) | Highlights and strips trailing whitespace |
| [vim-test](https://github.com/vim-test/vim-test) | Run tests from inside Neovim (keybindings commented out by default) |
| [psf/black](https://github.com/psf/black) | Python formatter, invoked via `:Black` |

## Role Variables

| Variable | Default | Description |
|---|---|---|
| `install` | `true` | Set to `false` to uninstall Neovim and remove `~/.config/nvim` |

## Config Structure

```
~/.config/nvim/
├── init.lua                    # Entry point — loads conf.set, conf.remap, conf.plugins
└── lua/conf/
    ├── set.lua                 # Vim options (line numbers, tabs, etc.)
    ├── remap.lua               # Key remappings
    ├── utils.lua               # Helper functions (map, etc.)
    ├── plugins.lua             # lazy.nvim bootstrap + all plugin specs
    └── plugins/                # Per-plugin config files
        ├── colors.lua          # nightfox setup + colorscheme
        ├── filetype.lua        # filetype.nvim overrides
        ├── lsp.lua             # lsp-zero v4 + cmp + mason setup
        ├── nvimtree.lua        # nvim-tree setup
        ├── telescope.lua       # telescope keymaps
        └── test.lua            # vim-test keymaps (commented out)
```

Each plugin's config lives in `lua/conf/plugins/<name>.lua` and is loaded via a `config` callback in the lazy.nvim spec — this guarantees the config runs after the plugin is on the runtimepath, regardless of load order.

## Fonts

Installs [DejaVu Sans Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts) to `~/.local/share/fonts/` and runs `fc-cache` to register it. This font is required for file icons in nvim-tree, barbar, and lualine to render correctly.

## Steam Deck Notes

The SteamOS root filesystem is read-only and wiped on OS updates, so pacman installs don't persist. This role instead downloads static binaries directly to `~/.local/bin/`:

| Tool | Source |
|---|---|
| `nvim` | GitHub release tarball (`nvim-linux-x86_64.tar.gz`) — extracted to `~/.local/` |
| `rg` (ripgrep) | Latest musl release resolved via GitHub API |
| `fd` | Latest musl release resolved via GitHub API |

Delete a binary to force an upgrade on the next run (the `creates:` guard makes the download idempotent).

## Example Playbook

```yaml
- hosts: all
  roles:
    - jahrik.nvim
```

To uninstall:

```yaml
- hosts: all
  vars:
    install: false
  roles:
    - jahrik.nvim
```

## Testing

```bash
molecule test
```

Step by step:

```bash
molecule converge
molecule verify
molecule destroy
```

Steam Deck scenario:

```bash
molecule test -s steamdeck
```

## License

GPLv2

## Author Information

jahrik@gmail.com — https://homelab.business/
