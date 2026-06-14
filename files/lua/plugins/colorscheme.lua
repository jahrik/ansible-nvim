return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false, -- Load immediately
	priority = 1000, -- Load before all other plugins
	opts = {
		flavour = "mocha",
		transparent_background = false,
		term_colors = true,
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
