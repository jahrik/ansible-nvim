# Changelog

All notable changes to this role will be documented in this file.

## [Unreleased]

### Changed

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
