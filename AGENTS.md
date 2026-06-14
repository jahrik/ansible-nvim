# ansible-nvim

Installs [Neovim](https://neovim.io/) and deploys a full Lua-based configuration to `~/.config/nvim/`. Sets up LSP support, Packer plugins, Nerd Fonts, and the `neovim` npm and Python packages. Supports Arch Linux, Debian/Ubuntu, and macOS.

## Key Variables

| Variable | Default | Description |
|---|---|---|
| `install` | `true` | Set to `false` to uninstall neovim and remove `~/.config/nvim` |

## Task Flow

`tasks/main.yml` → `install.yml` or `uninstall.yml` based on `install | bool`

**install.yml:**
1. Include `archlinux.yml`, `debian.yml`, or `darwin.yml` for OS-specific dependencies
2. Create `~/.local/share/fonts` and download DejaVu Nerd Fonts
3. Install `neovim` package (Arch only — Debian and Darwin handle this in their OS task)
4. Install `neovim` npm package globally
5. Create Python virtualenv at `/usr/local/share/nvim/python3` with `neovim` module (Linux only)
6. Create `~/.config/nvim/` directory tree
7. Copy all Lua config files (`init.lua`, `lua/conf/*.lua`, `after/plugin/*.lua`)

**archlinux.yml:** `community.general.pacman` installs fd, nodejs, npm, python-pynvim, ripgrep, etc.

**debian.yml:** apt installs nodejs, npm, and neovim from Ubuntu universe (no PPA needed on 24.04+)

**darwin.yml:** Homebrew installs fd, fontconfig, node, ripgrep, unzip, neovim, and pynvim (become: false throughout)

**uninstall.yml:** removes neovim (via homebrew on Darwin, package module elsewhere) and `~/.config/nvim`

## Testing

```bash
yamllint .
ansible-lint
molecule test
molecule converge
molecule destroy
```

## CI

- **Lint**: yamllint + ansible-lint
- **Molecule**: Ubuntu 24.04 + Arch Linux via Docker
- **macOS**: ansible-playbook against the GHA runner directly (macos-latest)
