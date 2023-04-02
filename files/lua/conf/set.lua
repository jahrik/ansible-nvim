vim.opt.autoread = true
vim.opt.background = 'dark'
vim.opt.completeopt = {'menuone', 'noinsert', 'noselect'}  -- completion options (for deoplete)
vim.opt.cursorline = true               -- highlight current line
vim.opt.encoding = "utf-8"
vim.opt.expandtab = true                -- spaces instead of tabs
vim.opt.hidden = true                   -- enable background buffers
vim.opt.ignorecase = true               -- ignore case in search
vim.opt.joinspaces = false              -- no double spaces with join
vim.opt.list = true                     -- show some invisible characters
vim.opt.mouse = "nv"                    -- Enable mouse in normal and visual modes
vim.opt.number = true                   -- show line numbers
vim.opt.relativenumber = false          -- number relative to current line
vim.opt.shiftround = true               -- round indent
vim.opt.shiftwidth = 2                  -- size of indent
vim.opt.smartcase = true                -- do not ignore case with capitals
vim.opt.smartindent = true              -- insert indents automatically
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.wrap = false                    -- disable line wrap

vim.cmd[[filetype plugin on]]
vim.cmd[[autocmd FileType * setlocal formatoptions-=cro]]
vim.cmd[[autocmd FocusGained * checktime]]
vim.cmd[[colorscheme nightfox]]

vim.cmd[[autocmd BufWritePre *.py execute 'Black']]
-- vim.cmd[[autocmd BufEnter *.astro set ft=astro]]
