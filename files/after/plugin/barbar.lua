local map = require("conf.utils").map
local opts = { noremap = true, silent = true }

-- Buffer navigation
map("n", "<Leader>n", ":BufferPrevious<CR>")
map("n", "<Leader>m", ":BufferNext<CR>")
map("n", "<Leader>N", ":BufferMovePrevious<CR>")
map("n", "<Leader>M", ":BufferMoveNext<CR>")
-- Pin/unpin buffer
map('n', '<Leader>p', ':BufferPin<CR>', opts)
-- Close buffer
map("n", "<Leader>c", ":BufferClose<CR>")
