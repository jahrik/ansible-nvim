return {
	"hat0uma/csvview.nvim",
	ft = { "csv", "tsv" },
	keys = {
		{
			"<leader>cv",
			function()
				require("csvview").toggle()
			end,
			desc = "Toggle CSV view",
		},
	},
	opts = {
		view = {
			display_mode = "border",
			sticky_header = {
				enabled = true,
			},
		},
		parser = {
			async_chunksize = 50,
		},
	},
}
