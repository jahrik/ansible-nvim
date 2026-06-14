# ansible-nvim

Installs [Neovim](https://neovim.io/) and deploys a full Lua-based configuration to `~/.config/nvim/`. Uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management. Supports Arch Linux, Debian/Ubuntu, macOS, and Steam Deck.

## Key Variables

| Variable | Default | Description |
|---|---|---|
| `install` | `true` | Set to `false` to uninstall Neovim and remove `~/.config/nvim` |

## Task Flow

`tasks/main.yml` → `install.yml` or `uninstall.yml` based on `install | bool`

**install.yml:**
1. Stat `/etc/steamos-release` → set `is_steamdeck` fact
2. Include OS-specific tasks: `steamdeck.yml`, `archlinux.yml`, `debian.yml`, or `darwin.yml`
3. Create `~/.local/share/fonts`, download DejaVu Nerd Fonts, notify `Fc-cache` handler
4. Install `neovim` package (Arch only — other OS tasks own their install)
5. Create `~/.config/nvim/lua/conf/plugins/` directory tree
6. Copy all Lua config files (`init.lua`, `lua/conf/*.lua`, `lua/conf/plugins/*.lua`)

**archlinux.yml:** pacman installs fd, fontconfig, ripgrep, unzip

**debian.yml:** apt installs fd-find, fontconfig, ripgrep, unzip, curl, git, neovim

**darwin.yml:** Homebrew installs fd, fontconfig, ripgrep, unzip, neovim (`become: false` throughout)

**steamdeck.yml:** All tasks run without `become` (SteamOS has a read-only root).
- Downloads `nvim-linux-x86_64.tar.gz` to `~/.local/`
- Resolves ripgrep and fd latest releases via GitHub API, extracts musl static binaries to `~/.local/bin/`
- Uses `creates:` guards for idempotency — delete a binary to force upgrade

**uninstall.yml:** Removes neovim (homebrew on Darwin, tarball files on Steam Deck, package module on Linux) and `~/.config/nvim/`

## Config Structure

```
~/.config/nvim/
├── init.lua                    # Loads conf.set, conf.remap, conf.plugins
└── lua/conf/
    ├── set.lua                 # Vim options
    ├── remap.lua               # Key remappings
    ├── utils.lua               # map() helper
    ├── plugins.lua             # lazy.nvim bootstrap + plugin specs
    └── plugins/                # Per-plugin config files
        ├── colors.lua          # nightfox + terafox colorscheme
        ├── filetype.lua        # filetype.nvim overrides
        ├── lsp.lua             # lsp-zero v4 + nvim-cmp + mason
        ├── nvimtree.lua        # nvim-tree setup
        ├── telescope.lua       # telescope keymaps
        └── test.lua            # vim-test keymaps (commented out)
```

Each plugin's config is `require()`d from its lazy.nvim `config` callback — guarantees correct load order without relying on `after/plugin/` auto-sourcing.

## Testing

```bash
yamllint .
ansible-lint
molecule test
molecule test -s steamdeck
molecule converge
molecule destroy
```

## CI

- **Lint**: yamllint + ansible-lint
- **Molecule**: Ubuntu 24.04 + Arch Linux via Docker
- **Steam Deck**: Arch container with `/etc/steamos-release` stub
- **macOS**: `ansible-playbook` against the GHA runner directly (macos-latest)
- **Release**: publishes to Ansible Galaxy on merge to `main`
