return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Trouble",
	keys = {
		{ "<leader>q", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
		{ "<leader>Q", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics (Trouble)" },
		{ "<leader>xS", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)" },
		{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location list (Trouble)" },
		{ "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list (Trouble)" },
		{ "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "TODOs (Trouble)" },
	},
	opts = {
		focus = true,
	},
}
