# Changelog

All notable changes to this role will be documented in this file.

## 2026-06-14

### Added

- `mini.starter` start screen with ASCII header, Telescope actions, recent files, and plugin stats footer
- Debian: Migrated PPA repo to `deb822_repository` module (replaces deprecated `apt_repository`)

### Fixed

- README: Added missing Trouble keybindings (`<leader>xS`, `<leader>xL`, `<leader>xQ`, `<leader>xt`)
- README: Added missing Copilot panel keybinding (`<leader>cp`)
- README: Added missing Git keybindings (`<leader>hu`, `<leader>tb`, `<leader>tD`)
- Debian: Replaced deprecated `ansible_distribution_release` with `ansible_facts['distribution_release']`

### Changed

- **LSP config API**: Migrated to native `vim.lsp.config()` with `automatic_enable`
- **Icons**: Replaced `nvim-web-devicons` with `mini.icons`
- **Auto-pairs**: Replaced `nvim-autopairs` with `mini.pairs`
- **Treesitter**: Removed plugin spec; Neovim 0.10+ bundles treesitter, `tree-sitter` CLI installed as system dep
- **Neotest keybinds**: Moved from `<leader>t` prefix to `<leader>n` prefix
- **Plugin versions**: Added `version = "*"` pins to conform, copilot, dap, gitsigns, lsp, mini, telescope, trouble, which-key
- **Uninstall**: Now also removes `~/.local/share/nvim`

### Added

- `tree-sitter` CLI as a system dependency (pacman/brew on Arch/macOS, binary download on Debian/Steam Deck)
- `marksman` LSP server (Markdown)
- which-key group specs for Copilot, Debug, Database, Neotest, Python, Diagnostics

### Removed

- `nvim-autopairs` (replaced by `mini.pairs`)
- `nvim-web-devicons` (replaced by `mini.icons`)
- `nvim-treesitter` plugin spec (using built-in treesitter)

## 2026-06-13

### Changed

- **Neovim version (Ubuntu/Debian)**: Install from neovim-ppa/unstable to get 0.10+ (required by plugins)
- **OS task layout**: Moved neovim install, font download, and font cache into respective OS task files
- **Molecule verify**: Added nvim binary check, lua syntax validation, and lazy.nvim plugin sync test
- **Molecule Arch**: Added prepare.yml to disable pacman internal sandbox in Docker containers
- **Deprecated syntax**: Replaced `ansible_os_family` with `ansible_facts['os_family']`
- **Config structure**: Replaced flat `lua/conf/` layout with `lua/core/` + `lua/plugins/` (lazy.nvim auto-import)
- **Leader key**: Changed from `,` to `<Space>`
- **Indent width**: Changed from 2 spaces to 4 spaces
- **Colorscheme**: Replaced nightfox/terafox with catppuccin (mocha)
- **Statusline**: Replaced lualine with mini.statusline
- **File explorer**: Replaced nvim-tree with neo-tree
- **Buffer management**: Removed barbar, using telescope buffers (`<leader><leader>`)
- **Completion engine**: Replaced nvim-cmp with blink.cmp (Rust-based fuzzy matching)
- **LSP setup**: Replaced lsp-zero with direct nvim-lspconfig + Mason + mason-tool-installer
- **Test runner**: Replaced vim-test with neotest (pytest adapter)
- **Formatting**: Added conform.nvim with format-on-save (stylua, ruff, isort, sqlfluff, prettier)
- **Linting**: Added nvim-lint (sqlfluff for SQL)

### Added

- blink.cmp completion with LuaSnip snippets
- basedpyright LSP (Python type checking)
- ruff LSP (Python linting)
- taplo LSP (TOML)
- yamlls LSP with SchemaStore integration
- nvim-dap with debugpy for Python debugging
- nvim-dap-ui and nvim-dap-virtual-text
- copilot.lua (GitHub Copilot inline suggestions)
- claude-code.nvim (Claude Code integration)
- gitsigns.nvim (git gutter + hunk actions)
- lazygit.nvim
- which-key.nvim (keymap popup)
- trouble.nvim (diagnostics list)
- todo-comments.nvim
- indent-blankline.nvim
- nvim-autopairs
- mini.ai (enhanced text objects)
- mini.surround
- venv-selector.nvim (Python virtualenv picker)
- vim-dadbod + UI + completion (database client)
- lazydev.nvim (Lua LSP for Neovim config)
- treesitter with auto-install for common languages
- macOS support via Homebrew
- `vim.g.have_nerd_font` flag for icon-aware plugins

### Removed

- nightfox.nvim / terafox theme
- lualine.nvim
- barbar.nvim (buffer tabs)
- nvim-tree.lua
- lsp-zero.nvim
- nvim-cmp and all cmp-* sources
- vim-test
- filetype.nvim
- vim-better-whitespace
- psf/black
- dap-go / delve (Go debugger)
- `lua/conf/utils.lua` helper module
