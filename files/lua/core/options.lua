local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.signcolumn = "yes"
opt.scrolloff = 10
opt.showmode = false
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Editor Behavior
opt.mouse = "a"
opt.wrap = false
opt.splitright = true
opt.splitbelow = true
opt.breakindent = true
opt.confirm = true
opt.updatetime = 250
opt.timeoutlen = 300

-- Searching
opt.ignorecase = true
opt.smartcase = true

-- Tabs & Indentation
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.shiftround = true
opt.smartindent = true

-- Undo & Clipboard
opt.undofile = true
opt.inccommand = "split"
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Prevent auto-comment continuation
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		opt.formatoptions:remove({ "r", "o" })
	end,
})
