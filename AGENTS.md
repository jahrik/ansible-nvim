# ansible-nvim

Installs [Neovim](https://neovim.io/) and deploys a full Lua-based configuration to `~/.config/nvim/`. Uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management. Supports Arch Linux, Debian/Ubuntu, macOS, and Steam Deck.

## Key Variables

| Variable | Default | Description |
|---|---|---|
| `install` | `true` | Set to `false` to uninstall Neovim and remove `~/.config/nvim` and `~/.local/share/nvim` |

## Task Flow

`tasks/main.yml` -> `install.yml` or `uninstall.yml` based on `install | bool`

**install.yml:**
1. Include OS-specific tasks: `steamdeck.yml` on SteamOS, or `archlinux.yml`, `debian.yml`, or `darwin.yml` based on OS family.
2. Create `~/.local/share/fonts`, download DejaVu Nerd Fonts, notify `Fc-cache` handler.
3. Recursive copy of `files/` to `~/.config/nvim/` (new plugins deploy without task edits).

**archlinux.yml:** pacman installs fd, fontconfig, ripgrep, unzip, tree-sitter

**debian.yml:** apt installs fd-find, fontconfig, ripgrep, unzip, curl, git, neovim (via neovim-ppa/unstable for 0.10+), tree-sitter binary

**darwin.yml:** Homebrew installs fd, fontconfig, ripgrep, unzip, neovim, tree-sitter (`become: false` throughout)

**steamdeck.yml:** All tasks run without `become` (SteamOS has a read-only root).
- Downloads `nvim-linux-x86_64.tar.gz` to `~/.local/`
- Resolves ripgrep, fd, and tree-sitter latest releases via GitHub API, extracts musl static binaries to `~/.local/bin/`
- Uses `creates:` guards for idempotency

**uninstall.yml:** Removes neovim (homebrew on Darwin, tarball files on Steam Deck, package module on Linux) and `~/.config/nvim/` and `~/.local/share/nvim/`

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
        ├── codecompanion.lua
        ├── colorscheme.lua
        ├── conform.lua
        ├── copilot.lua
        ├── csvview.lua
        ├── dadbod.lua
        ├── gitsigns.lua
        ├── indent_line.lua
        ├── iron.lua
        ├── lazydev.lua
        ├── lazygit.lua
        ├── lint.lua
        ├── lsp.lua
        ├── mini.lua
        ├── neo-tree.lua
        ├── neotest.lua
        ├── overseer.lua
        ├── render-markdown.lua
        ├── telescope.lua
        ├── todo_comments.lua
        ├── trouble.lua
        ├── venv_selector.lua
        └── which_key.lua
```

Each plugin is a self-contained spec returned from its file. lazy.nvim auto-imports everything in `plugins/`.

## Testing

```bash
uv sync
source .venv/bin/activate
yamllint .
ansible-lint
molecule test
molecule test -s steamdeck
molecule converge
molecule destroy
```

Localhost scenario (used in CI on the macOS GitHub Actions runner):

```bash
molecule converge -s localhost
molecule verify -s localhost
```

## CI

- **Lint**: yamllint + ansible-lint
- **Molecule**: Ubuntu 24.04 + Arch Linux via Docker
- **Steam Deck**: Arch container with `/etc/steamos-release` stub
- **macOS**: `ansible-playbook` against the GHA runner directly (macos-latest)
- **Release**: publishes to Ansible Galaxy on merge to `main`
