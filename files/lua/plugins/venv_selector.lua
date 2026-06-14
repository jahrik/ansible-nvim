return {
	"linux-cultist/venv-selector.nvim",
	dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
	ft = "python",
	opts = {},
	keys = {
		{ "<leader>pv", "<cmd>VenvSelect<CR>", desc = "[P]ython [V]env select" },
	},
}
