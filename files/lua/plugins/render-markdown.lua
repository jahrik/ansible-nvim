return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown", "codecompanion" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{
			"<leader>mr",
			function()
				require("render-markdown").toggle()
			end,
			desc = "Toggle markdown render",
		},
	},
	opts = {
		render_modes = { "n", "c", "t" },
		code = {
			sign = false,
			width = "block",
			right_pad = 1,
		},
		heading = {
			sign = false,
			icons = {},
		},
		checkbox = {
			enabled = true,
		},
	},
}
