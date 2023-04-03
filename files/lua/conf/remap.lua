-- Import & assign the map() function from the utils module
local map = require("conf.utils").map

vim.g.mapleader = ","
map("n", "<bs>", ":nohlsearch<cr>", { silent = true })

-- Buffer navigation
map("n", "<Leader>n", ":BufferPrevious<CR>")
map("n", "<Leader>m", ":BufferNext<CR>")
map("n", "<Leader>c", ":BufferClose<CR>")
map("n", "<Leader>N", ":BufferMovePrevious<CR>")
map("n", "<Leader>M", ":BufferMoveNext<CR>")

-- Project Explorer
map("n", "<Leader>e", ":NvimTreeOpen<CR>")
map("n", "<C-p>", ":NvimTreeToggle<CR>")

-- " Better indent control
-- vnoremap < <gv
-- vnoremap > >gv

-- Unit Test
map("n", "<Leader>tf", ":TestNearest<CR>" )
map("n", "<Leader>tt", ":TestLast<CR>" )
map("n", "<Leader>tb", ":TestFile<CR>" )
map("n", "<Leader>tg", ":testvisit<cr>" )
