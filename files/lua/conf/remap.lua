-- Import & assign the map() function from the utils module
local map = require("conf.utils").map

vim.g.mapleader = ","

-- Remove search highlight
map("n", "<bs>", ":nohlsearch<cr>", { silent = true })

-- Project Explorer
map("n", "<Leader>e", ":NvimTreeOpen<CR>")
map("n", "<C-p>", ":NvimTreeToggle<CR>")

-- Better indent control
map("v", "<", "<gv" )
map("v", ">", ">gv" )

-- Unit Test
map("n", "<Leader>tf", ":TestNearest<CR>" )
map("n", "<Leader>tt", ":TestLast<CR>" )
map("n", "<Leader>tb", ":TestFile<CR>" )
map("n", "<Leader>tg", ":testvisit<cr>" )

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')

-- Terminal mappings
map('n', '<C-t>', ':term<CR>')  -- open
map('t', '<Esc>', '<C-\\><C-n>') -- exit
