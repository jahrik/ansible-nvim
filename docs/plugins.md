# Plugin Guide

How to use each plugin in daily work. For keybindings, see [keybindings.md](keybindings.md).

## Completion (blink.cmp)

Completion appears automatically as you type. It pulls from multiple sources in priority order: LSP, file paths, snippets, buffer words, and SQL tables (when connected via dadbod).

- Type normally and the menu appears
- `<C-Space>` forces the menu open if it hasn't triggered
- `<C-n>`/`<C-p>` to navigate, `<C-y>` to confirm
- Documentation preview shows after 500ms hover on an item
- Signature help appears automatically when you type `(` after a function

Snippets expand on confirm. Tab through snippet placeholders with `<Tab>`.

## LSP

Language servers start automatically when you open a supported file. Mason installs them on first use.

**Configured servers:**
- `ruff` - Python linting and import sorting
- `lua_ls` - Lua (Neovim API aware via lazydev)
- `yamlls` - YAML with SchemaStore for known schemas (docker-compose, GitHub Actions, etc.)
- `taplo` - TOML
- `marksman` - Markdown (links, headings)

**Diagnostics** appear inline as virtual text. Hover over an error to see the full message. Use `<leader>q` to open the diagnostics panel (Trouble).

**Inlay hints** show inferred types and parameter names. Toggle with `<leader>th`.

## Formatting (conform.nvim)

Format-on-save is enabled for all files. When you write a buffer, the configured formatter runs automatically.

| Filetype | Formatter |
|---|---|
| Python | isort (imports) + ruff (code) |
| Lua | stylua |
| SQL | sqlfluff (postgres dialect, dbt templater) |
| Markdown | prettier |

Manual format: `<leader>f` in normal or visual mode.

If format-on-save is too slow for a large file, it has a 1000ms timeout and will skip gracefully.

## Linting (nvim-lint)

Linters run on file open, save, and leaving insert mode. Results appear as diagnostics.

| Filetype | Linter |
|---|---|
| SQL | sqlfluff |

Python linting is handled by the ruff LSP server directly, not nvim-lint.

## File Explorer (Neo-tree)

Press `\` to toggle the file tree on the left side. It auto-closes when you select a file.

- Navigate with `j`/`k`
- Open file with `<CR>`
- Create file: `a`
- Delete: `d`
- Rename: `r`
- Copy: `c`, paste: `p`

## Fuzzy Finding (Telescope)

Telescope is the search hub. Most searches start with `<leader>s`.

Tips:
- In the picker, `<C-x>` opens in a horizontal split, `<C-v>` in a vertical split
- `<C-q>` sends all results to the quickfix list
- Results are sorted by recency/relevance via the FZF algorithm
- `<leader>s.` (recent files) is useful for jumping back to something you had open earlier

## Testing (neotest)

Run pytest from inside Neovim with results shown inline.

- `<leader>nt` runs the single test nearest to your cursor
- `<leader>nf` runs all tests in the current file
- `<leader>ns` opens the summary panel showing pass/fail for all tests
- `<leader>nl` re-runs the last test (useful while fixing a failure)

Test output appears in a floating window. Failures show as diagnostics on the failing line.

The runner uses `--maxfail=1` by default so it stops at the first failure.

## REPL (iron.nvim)

Interactive Python/IPython session inside Neovim. Send code from your buffer to the REPL without leaving the editor.

**Starting:** `<leader>rs` opens IPython (falls back to python3) in a vertical split.

**Sending code:**
- `<leader>rl` - send the current line
- `<leader>rv` - send visual selection (select lines first with `V`)
- `<leader>rm` - send a motion (e.g., `<leader>rmap` sends the current paragraph)
- `<leader>rb` - send from the last `# %%` marker up to cursor
- `<leader>rf` - send the entire file

**Cell workflow:** Use `# %%` comments as cell delimiters in your Python files. Place cursor in a cell and use `<leader>rb` to execute just that block.

**Managing:** `<leader>rc` clears the REPL screen, `<leader>rq` closes it.

The REPL persists across buffer switches. You can edit code, send it, see the output, tweak, and re-send.

## CSV Viewing (csvview.nvim)

Opens CSV and TSV files with aligned columns displayed as virtual text.

- Open any `.csv` or `.tsv` file
- Press `<leader>cv` to toggle the tabular view
- Header row stays pinned when scrolling
- Auto-detects delimiter (comma, tab, pipe)
- Toggle off with `<leader>cv` again to edit raw text

## Task Runner (overseer.nvim)

Run shell commands (dbt, pytest, scripts) with output captured in a Neovim buffer.

- `<leader>or` opens the task picker (shell command, or predefined templates)
- `<leader>ot` toggles the output panel
- `<leader>ol` re-runs the last task without the picker
- `<leader>oa` shows actions for running tasks (kill, restart, dispose)

**Custom templates:** Create `.overseer/` in your project root with task definitions for repeated commands. See overseer.nvim docs for template format.

**Built-in templates:** overseer detects Makefiles, package.json scripts, and other common task sources automatically.

## Database (dadbod)

Query databases directly from Neovim with completion and result display.

1. `<leader>Du` opens the DB UI sidebar
2. `<leader>Da` to add a connection (enter a URL like `postgres://user:pass@host/db`)
3. Write SQL in the scratch buffer
4. Execute with `<CR>` in the DB UI
5. Results display in a split below

SQL completion works automatically in `.sql` files and dadbod scratch buffers (table names, column names, keywords).

Supports PostgreSQL, MySQL, SQLite, DuckDB, BigQuery, and many more.

## Git (gitsigns + lazygit)

**Gitsigns** shows changed/added/removed lines in the gutter. Hunk operations:
- `<leader>hs` stages the hunk under cursor
- `<leader>hr` reverts the hunk
- `<leader>hp` shows a preview of what changed
- `]c`/`[c` jumps between changed hunks

**LazyGit** (`<leader>lg`) opens a full-screen terminal UI for git operations (staging, committing, rebasing, cherry-picking). It's a complete git client.

## AI Chat (CodeCompanion)

Multi-turn chat with Claude inside Neovim. Requires `ANTHROPIC_API_KEY` environment variable.

- `<leader>ac` opens/toggles the chat buffer
- Type your question and press `<CR>` to send
- `<leader>ai` shows the actions menu (explain, fix, refactor, tests, etc.)
- In visual mode, select code then `<leader>aa` to add it as context to the chat
- In visual mode, select code then `<leader>ai` to run an action on it

The chat buffer supports markdown rendering (headings, code blocks, tables) via render-markdown.nvim.

## Copilot

Ghost text suggestions appear as you type. They're dimmed inline text showing what Copilot predicts.

- `<M-y>` (Option+Y on Mac) accepts the full suggestion
- `<M-n>`/`<M-p>` cycles through alternatives
- `<leader>ce`/`<leader>cd` enables/disables Copilot
- `<leader>cp` opens the Copilot panel for longer completions

Copilot respects your `.gitignore` and won't suggest in sensitive files.

## Markdown Rendering (render-markdown.nvim)

Rich display of markdown files directly in the buffer.

- Headings get colored backgrounds
- Tables render with box-drawing borders
- Code blocks show with language labels
- Checkboxes display as icons
- Entering insert mode reveals raw markdown for editing
- `<leader>mr` toggles rendering on/off

Works in `.md` files and CodeCompanion chat buffers.

## Virtual Environment (venv-selector)

Pick a Python virtual environment without restarting Neovim.

- `<leader>pv` opens the venv picker
- It searches for venvs in common locations (`.venv`, `venv`, Poetry, uv, Conda, Pyenv)
- Selecting one repoints the LSP and REPL to use that interpreter

## Which-Key

Press `<leader>` and wait. A popup appears showing all available bindings organized by group. Navigate the menu to discover commands you've forgotten.

Groups: `[A]I`, `[C]opilot`, `[D]atabase`, `Git [H]unk`, `[M]arkdown`, `[N]eotest`, `[O]verseer`, `[P]ython`, `[R]EPL`, `[S]earch`, `[T]oggle`, `Diagnostics`.
