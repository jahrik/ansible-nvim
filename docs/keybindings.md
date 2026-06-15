# Keybindings Reference

Leader key: `<Space>`

## General

| Key | Action |
|---|---|
| `<Esc>` | Clear search highlight |
| `<C-h/j/k/l>` | Navigate splits |
| `<leader>f` | Format buffer |
| `\` | Toggle Neo-tree file explorer |
| `<leader><leader>` | Find open buffers |
| `<leader>/` | Fuzzy search current buffer |

## Search (Telescope)

| Key | Action |
|---|---|
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep (search all files) |
| `<leader>sh` | Help tags |
| `<leader>sk` | Keymaps |
| `<leader>sd` | Diagnostics |
| `<leader>sr` | Resume last search |
| `<leader>s.` | Recent files |
| `<leader>s/` | Grep open files only |
| `<leader>sn` | Search Neovim config files |
| `<leader>ss` | Telescope builtins |
| `<leader>sw` | Grep current word under cursor |

## LSP

| Key | Action |
|---|---|
| `grd` | Go to definition |
| `grD` | Go to declaration |
| `gri` | Go to implementation |
| `grr` | Go to references |
| `grt` | Go to type definition |
| `gO` | Document symbols |
| `gW` | Workspace symbols |
| `grn` | Rename symbol |
| `gra` | Code action |
| `<leader>th` | Toggle inlay hints |

## Completion (blink.cmp)

| Key | Action |
|---|---|
| `<C-Space>` | Trigger completion menu |
| `<C-n>` | Next item |
| `<C-p>` | Previous item |
| `<C-y>` | Confirm selection |
| `<C-e>` | Dismiss menu |
| `<C-b>` / `<C-f>` | Scroll docs up/down |

## Testing (neotest)

| Key | Action |
|---|---|
| `<leader>nt` | Run nearest test |
| `<leader>nf` | Run all tests in file |
| `<leader>ns` | Toggle test summary panel |
| `<leader>nl` | Re-run last test |

## REPL (iron.nvim)

| Key | Action |
|---|---|
| `<leader>rs` | Start REPL (ipython if available) |
| `<leader>rq` | Quit REPL |
| `<leader>rc` | Clear REPL |
| `<leader>rl` | Send current line |
| `<leader>rf` | Send entire file |
| `<leader>rv` | Send visual selection (visual mode) |
| `<leader>rb` | Send cell block (up to cursor) |
| `<leader>rm` | Send motion (e.g., `<leader>rmap` sends paragraph) |

## Git

| Key | Action |
|---|---|
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage entire buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hR` | Reset entire buffer |
| `<leader>hp` | Preview hunk inline |
| `<leader>hb` | Blame current line |
| `<leader>hd` | Diff against index |
| `<leader>hD` | Diff against last commit |
| `<leader>tb` | Toggle git blame line |
| `<leader>tD` | Toggle show deleted lines |
| `<leader>lg` | Open LazyGit |
| `]c` / `[c` | Next/previous git change |

## Diagnostics (Trouble)

| Key | Action |
|---|---|
| `<leader>q` | Toggle all diagnostics |
| `<leader>Q` | Buffer diagnostics only |
| `<leader>xS` | Symbols |
| `<leader>xL` | Location list |
| `<leader>xQ` | Quickfix list |
| `<leader>xt` | TODOs across project |

## Database (dadbod)

| Key | Action |
|---|---|
| `<leader>Du` | Toggle DB UI |
| `<leader>Da` | Add DB connection |
| `<leader>Df` | Find DB buffer |

## CSV

| Key | Action |
|---|---|
| `<leader>cv` | Toggle tabular CSV/TSV view |

## Task Runner (overseer)

| Key | Action |
|---|---|
| `<leader>or` | Run task (shows picker) |
| `<leader>ot` | Toggle task output panel |
| `<leader>ol` | Re-run last task |
| `<leader>oa` | Task actions (kill, restart, etc.) |

## Markdown

| Key | Action |
|---|---|
| `<leader>mr` | Toggle rendered markdown view |

## AI

| Key | Action |
|---|---|
| `<leader>ac` | Toggle AI chat (CodeCompanion) |
| `<leader>ai` | AI actions menu |
| `<leader>aa` | Add selection to chat (visual mode) |

## Copilot

| Key | Action |
|---|---|
| `<M-y>` | Accept suggestion |
| `<M-n>` | Next suggestion |
| `<M-p>` | Previous suggestion |
| `<leader>ce` | Enable Copilot |
| `<leader>cd` | Disable Copilot |
| `<leader>cs` | Copilot status |
| `<leader>cp` | Copilot panel |

## Editing (mini.nvim)

| Key | Action |
|---|---|
| `sa` | Add surrounding (e.g., `saiw"` surrounds word with quotes) |
| `sd` | Delete surrounding |
| `sr` | Replace surrounding |
| `ai` / `an` | Around/inside text objects (enhanced) |
