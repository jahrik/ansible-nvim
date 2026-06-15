## NEOVIM

[![CICD](https://github.com/jahrik/ansible-nvim/actions/workflows/cicd.yml/badge.svg)](https://github.com/jahrik/ansible-nvim/actions/workflows/cicd.yml)

Installs [Neovim](https://neovim.io/) and deploys a full Lua-based configuration to `~/.config/nvim/`. Manages plugins with [lazy.nvim](https://github.com/folke/lazy.nvim), sets up LSP with Mason, and installs [DejaVu Sans Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts) for icon support.

## OS Support

| Platform | Install method |
|---|---|
| Arch Linux | `pacman` |
| Ubuntu / Debian | `apt` via [neovim-ppa/unstable](https://launchpad.net/~neovim-ppa/+archive/ubuntu/unstable) (provides Neovim 0.10+) |
| macOS | Homebrew (`become: false` throughout) |
| Steam Deck / SteamOS | Static binaries to `~/.local/bin` |

Steam Deck is detected automatically via `/etc/steamos-release`. Because SteamOS has a read-only root filesystem, all tools are installed to the user's home directory without `sudo`.

## Config Structure

```
~/.config/nvim/
├── init.lua              # Entry point: leader, nerd font flag, requires
└── lua/
    ├── core/
    │   ├── autocmds.lua  # Autocommands (yank highlight, etc.)
    │   ├── keymaps.lua   # Core keymaps (split nav, terminal escape)
    │   ├── lazy.lua      # lazy.nvim bootstrap and setup
    │   └── options.lua   # Vim options (tabs, search, UI, undo)
    └── plugins/          # One file per plugin (auto-imported by lazy.nvim)
        ├── blink.lua
        ├── claude.lua
        ├── colorscheme.lua
        ├── conform.lua
        ├── copilot.lua
        ├── dadbod.lua
        ├── dap.lua
        ├── gitsigns.lua
        ├── indent_line.lua
        ├── lazydev.lua
        ├── lazygit.lua
        ├── lint.lua
        ├── lsp.lua
        ├── mini.lua
        ├── neo-tree.lua
        ├── neotest.lua
        ├── telescope.lua
        ├── todo_comments.lua
        ├── trouble.lua
        ├── venv_selector.lua
        └── which_key.lua
```

## Plugins

Plugin management uses [lazy.nvim](https://github.com/folke/lazy.nvim), which bootstraps itself on first launch and installs all plugins automatically.

### UI

| Plugin | Purpose |
|---|---|
| [catppuccin](https://github.com/catppuccin/nvim) | Colorscheme (mocha flavour) |
| [mini.starter](https://github.com/echasnovski/mini.nvim) | Start screen with actions and recent files |
| [mini.statusline](https://github.com/echasnovski/mini.nvim) | Lightweight status line |
| [mini.icons](https://github.com/echasnovski/mini.nvim) | File type icons (replaces nvim-web-devicons) |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer sidebar |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indentation guides |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Popup showing available keybindings |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics list |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight TODO/FIXME/NOTE in comments |

### Navigation and Search

| Plugin | Purpose |
|---|---|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder for files, grep, buffers, LSP |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | FZF sorter for telescope |
| [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim) | Use telescope for `vim.ui.select` |

### LSP and Completion

| Plugin | Purpose |
|---|---|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP server configurations |
| [mason.nvim](https://github.com/mason-org/mason.nvim) | LSP/tool installer |
| [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim) | Bridge between mason and lspconfig |
| [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) | Auto-install tools via Mason |
| [blink.cmp](https://github.com/saghen/blink.cmp) | Completion engine (Rust-based fuzzy matching) |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Snippet collection |
| [fidget.nvim](https://github.com/j-hui/fidget.nvim) | LSP progress indicator |
| [schemastore.nvim](https://github.com/b0o/schemastore.nvim) | JSON/YAML schema catalogue |
| [lazydev.nvim](https://github.com/folke/lazydev.nvim) | Lua LSP configuration for Neovim development |

Configured LSP servers (auto-installed via Mason):

- `basedpyright` - Python type checking
- `ruff` - Python linting/formatting
- `lua_ls` - Lua
- `marksman` - Markdown
- `taplo` - TOML
- `yamlls` - YAML (with SchemaStore)

### Formatting and Linting

| Plugin | Purpose |
|---|---|
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Async formatter (format-on-save) |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | Async linter |

Formatters by filetype: `stylua` (Lua), `isort` + `ruff` (Python), `sqlfluff` (SQL), `prettier` (Markdown).

### Testing and Debugging

| Plugin | Purpose |
|---|---|
| [neotest](https://github.com/nvim-neotest/neotest) | Test runner framework |
| [neotest-python](https://github.com/nvim-neotest/neotest-python) | Pytest adapter for neotest |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol client |
| [nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python) | Python debugger (debugpy) |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | DAP UI (scopes, breakpoints, REPL) |
| [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text) | Inline variable display while debugging |

### Git

| Plugin | Purpose |
|---|---|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git gutter signs + hunk actions |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | LazyGit integration (`<leader>lg`) |

### AI Assistance

| Plugin | Purpose |
|---|---|
| [copilot.lua](https://github.com/zbirenbaum/copilot.lua) | GitHub Copilot inline suggestions |
| [claude-code.nvim](https://github.com/greggh/claude-code.nvim) | Claude Code integration |

### Editing

| Plugin | Purpose |
|---|---|
| [mini.ai](https://github.com/echasnovski/mini.nvim) | Enhanced around/inside text objects |
| [mini.pairs](https://github.com/echasnovski/mini.nvim) | Auto-close brackets and quotes |
| [mini.surround](https://github.com/echasnovski/mini.nvim) | Add/delete/replace surroundings |

### Database

| Plugin | Purpose |
|---|---|
| [vim-dadbod](https://github.com/tpope/vim-dadbod) | Database client |
| [vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui) | UI for dadbod |
| [vim-dadbod-completion](https://github.com/kristijanhusak/vim-dadbod-completion) | SQL completion via blink.cmp |

### Python

| Plugin | Purpose |
|---|---|
| [venv-selector.nvim](https://github.com/linux-cultist/venv-selector.nvim) | Python virtualenv picker (`<leader>pv`) |

## Key Bindings

Leader key is `<Space>`.

### General

| Key | Action |
|---|---|
| `<Esc>` | Clear search highlight |
| `<C-h/j/k/l>` | Navigate splits |
| `<leader>f` | Format buffer |
| `\` | Toggle Neo-tree |
| `<leader><leader>` | Find buffers |
| `<leader>/` | Fuzzy search current buffer |

### Search (Telescope)

| Key | Action |
|---|---|
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep |
| `<leader>sh` | Help tags |
| `<leader>sk` | Keymaps |
| `<leader>sd` | Diagnostics |
| `<leader>sr` | Resume last search |
| `<leader>s.` | Recent files |
| `<leader>s/` | Grep open files |
| `<leader>sn` | Search Neovim config files |
| `<leader>ss` | Telescope builtins |
| `<leader>sw` | Grep current word |

### LSP

| Key | Action |
|---|---|
| `grd` | Go to definition |
| `grD` | Go to declaration |
| `gri` | Go to implementation |
| `grr` | Go to references |
| `grt` | Go to type definition |
| `gO` | Document symbols |
| `gW` | Workspace symbols |
| `grn` | Rename |
| `gra` | Code action |
| `<leader>th` | Toggle inlay hints |

### Testing

| Key | Action |
|---|---|
| `<leader>nt` | Run nearest test |
| `<leader>nf` | Run tests in file |
| `<leader>ns` | Toggle test summary |
| `<leader>nl` | Run last test |

### Debugging

| Key | Action |
|---|---|
| `<leader>dd` | Start / Continue |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>du` | Step out |
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Conditional breakpoint |
| `<leader>dui` | Toggle DAP UI |
| `<leader>dr` | Toggle REPL |
| `<leader>dx` | Terminate debugger |

### Git

| Key | Action |
|---|---|
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hR` | Reset buffer |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>hd` | Diff against index |
| `<leader>hD` | Diff against last commit |
| `<leader>tb` | Toggle git blame line |
| `<leader>tD` | Toggle show deleted |
| `<leader>lg` | Open LazyGit |
| `]c` / `[c` | Next/previous git change |

### Diagnostics (Trouble)

| Key | Action |
|---|---|
| `<leader>q` | Toggle diagnostics |
| `<leader>Q` | Buffer diagnostics |
| `<leader>xS` | Symbols |
| `<leader>xL` | Location list |
| `<leader>xQ` | Quickfix list |
| `<leader>xt` | TODOs |

### Database

| Key | Action |
|---|---|
| `<leader>Du` | Toggle DB UI |
| `<leader>Da` | Add DB connection |
| `<leader>Df` | Find DB buffer |

### Copilot

| Key | Action |
|---|---|
| `<M-y>` | Accept suggestion |
| `<M-n>` / `<M-p>` | Next/previous suggestion |
| `<leader>ce` / `<leader>cd` | Enable/disable Copilot |
| `<leader>cs` | Copilot status |
| `<leader>cp` | Copilot panel |

## Requirements

- Neovim 0.10+
- A [Nerd Font](https://www.nerdfonts.com/) (DejaVu Sans Mono installed by the role)
- `make` (for telescope-fzf-native)
- `ripgrep` (for telescope live grep)
- `fd` (for telescope file finding)
- `tree-sitter` CLI (installed by the role on all platforms)

## Role Variables

| Variable | Default | Description |
|---|---|---|
| `install` | `true` | Set to `false` to uninstall Neovim and remove `~/.config/nvim` and `~/.local/share/nvim` |

## Fonts

Installs [DejaVu Sans Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts) to `~/.local/share/fonts/` (Linux) or via Homebrew cask (macOS) for file icons to render correctly.

## Steam Deck Notes

The SteamOS root filesystem is read-only and wiped on OS updates, so pacman installs don't persist. This role instead downloads static binaries directly to `~/.local/bin/`:

| Tool | Source |
|---|---|
| `nvim` | GitHub release tarball (`nvim-linux-x86_64.tar.gz`) |
| `rg` (ripgrep) | Latest musl release via GitHub API |
| `fd` | Latest musl release via GitHub API |
| `tree-sitter` | Latest release binary from GitHub |

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

Localhost scenario (used in CI on the macOS GitHub Actions runner):

```bash
molecule converge -s localhost
molecule verify -s localhost
```

## License

GPLv2

## Author Information

jahrik@gmail.com
