# Workflows

Step-by-step guides for common tasks. Assumes you know the basics of Neovim navigation (motions, modes, splits).

## Exploring a New Dataset

You have a CSV file and want to understand its shape before writing code.

1. Open the file: `:e data/sales.csv`
2. Toggle tabular view: `<leader>cv`
3. Scroll through with sticky headers to understand columns
4. Toggle off: `<leader>cv`
5. Start a REPL: `<leader>rs`
6. In your Python buffer, write exploratory code:

```python
# %% Load
import pandas as pd
df = pd.read_csv("data/sales.csv")

# %% Shape
df.shape
df.dtypes

# %% Sample
df.head(20)

# %% Stats
df.describe()

# %% Missing
df.isnull().sum()
```

7. Place cursor in "Load" cell, press `<leader>rb` to execute
8. Move to "Shape" cell, `<leader>rb` again
9. Iterate through cells as needed
10. When done: `<leader>rq` to close REPL

## Debugging a Failing Test

A pytest run shows a failure and you need to find the root cause.

1. Open the test file
2. Run the specific test: `<leader>nt` (cursor on the failing test)
3. See the failure output in the floating window
4. Navigate to the source code (`grd` on the function being tested)
5. Open a REPL: `<leader>rs`
6. Select the suspicious code and send it to the REPL: `<leader>rv`
7. Experiment with inputs to understand the failure
8. Fix the code
9. Re-run the test: `<leader>nl` (runs last test)
10. Green? Move on.

## Running dbt Models

You're working on a dbt model and want to run/test it.

**With overseer.nvim:**

1. Open your model file (e.g., `models/marts/orders.sql`)
2. `<leader>or` to open the task picker
3. Select "shell" and type: `dbt run --select orders`
4. Output appears in the bottom panel
5. If it fails, errors show in the output. Fix and re-run: `<leader>ol`
6. Run tests: `<leader>or` -> `dbt test --select orders`

**With dadbod (for ad-hoc queries):**

1. `<leader>Du` to open DB UI
2. `<leader>Da` to add your warehouse connection
3. Open a scratch SQL buffer from the UI
4. Write and execute queries to verify your model output
5. Completion gives you table/column names as you type

## Writing SQL with Linting

1. Open or create a `.sql` file
2. Write your query. sqlfluff lints on save and shows diagnostics inline.
3. Format on save applies sqlfluff formatting (Postgres dialect, dbt templater)
4. Use dadbod completion for table/column names if connected to a database
5. `<leader>q` opens the full diagnostics panel if there are many issues

Example dbt model workflow:
```sql
with source as (
    select * from {{ ref('stg_orders') }}
),

transformed as (
    select
        order_id,
        customer_id,
        order_date,
        sum(amount) as total_amount
    from source
    group by 1, 2, 3
)

select * from transformed
```

## Quick Python Development Cycle

Fast iteration on a Python module.

1. Open your Python file
2. LSP gives you:
   - Type errors from basedpyright (inline diagnostics)
   - Import sorting and lint fixes from ruff
   - Completion with type info via `<C-Space>`
3. Write code. Format-on-save handles style automatically.
4. Run the nearest test: `<leader>nt`
5. If it fails, check output, fix, re-run: `<leader>nl`
6. Need to check types? `<leader>th` toggles inlay hints
7. Rename a symbol across the project: `grn`
8. Find all references: `grr`
9. Jump to definition: `grd`, back with `<C-o>`

## Switching Virtual Environments

You're working across multiple Python projects with different venvs.

1. `<leader>pv` opens the venv picker
2. It discovers venvs from:
   - `.venv/` in project root (uv, standard venv)
   - `venv/` directories
   - Poetry environments
   - Conda environments
   - Pyenv versions
3. Select one. The LSP restarts with the new interpreter.
4. If using iron.nvim REPL, restart it (`<leader>rq`, `<leader>rs`) to pick up the new env.

## Git Workflow

Staging, reviewing, and committing changes without leaving Neovim.

**Quick hunk staging:**
1. Make changes to a file
2. `]c` jumps to the next changed hunk
3. `<leader>hp` previews what changed
4. `<leader>hs` stages just that hunk
5. Repeat for other hunks you want to include

**Full git operations:**
1. `<leader>lg` opens LazyGit
2. Navigate files with `j`/`k`, stage with `<Space>`
3. `c` to commit, type message, confirm
4. `p` to push
5. `q` to close and return to Neovim

**Reviewing changes:**
- `<leader>hd` shows diff of current file against index
- `<leader>hb` shows who last changed the current line
- `<leader>tb` toggles persistent blame annotations

## AI-Assisted Coding

Using CodeCompanion for help while coding.

**Ask a question:**
1. `<leader>ac` opens the chat
2. Type: "How should I handle connection pooling with asyncpg?"
3. Get a streamed response with code examples

**Explain unfamiliar code:**
1. Select the confusing code block (visual mode with `V`)
2. `<leader>ai` opens the actions menu
3. Select "Explain"
4. Explanation appears in the chat buffer

**Refactor with AI:**
1. Select code you want to change
2. `<leader>ai` -> choose an action, or `<leader>ac` and describe what you want
3. Review the suggested changes

**Add context:**
1. Open the chat: `<leader>ac`
2. Switch to the relevant buffer
3. Select relevant code, press `<leader>aa` to add it to the chat
4. Switch back to chat and ask your question with that context

## Querying a Database

Interactive database exploration with dadbod.

1. `<leader>Du` opens the DB UI panel on the left
2. First time: `<leader>Da`, enter connection URL:
   - PostgreSQL: `postgres://user:pass@localhost:5432/mydb`
   - SQLite: `sqlite:///path/to/db.sqlite`
   - DuckDB: `duckdb:///path/to/file.duckdb`
3. Expand the connection in the tree to see schemas/tables
4. Press `<CR>` on a table to see its contents
5. Open a new query buffer from the UI
6. Write SQL with full completion (tables, columns, keywords)
7. Execute with `<CR>` in the DB UI
8. Results appear in a split below

Tips:
- Multiple connections can be active simultaneously
- Query results can be navigated with normal Vim motions
- Use `:DBUIFindBuffer` (`<leader>Df`) to jump back to a query buffer

## Working with Markdown Documentation

Writing and previewing docs without leaving the terminal.

1. Open a markdown file
2. render-markdown.nvim shows it with:
   - Colored heading backgrounds
   - Table borders drawn with box characters
   - Code blocks with language labels
   - Checkbox icons
3. Enter insert mode to see raw markdown and edit
4. Exit insert mode to see rendered view
5. `<leader>mr` toggles rendering if you prefer raw view
6. Use telescope to search docs: `<leader>sg` and type your search term
