return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-neotest/neotest-python",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
					args = { "--maxfail=1" },
					runner = "pytest",
				}),
			},
		})
	end,
	keys = {
		{
			"<leader>nt",
			function()
				require("neotest").run.run()
			end,
			desc = "[N]eotest [T]his",
		},
		{
			"<leader>nf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "[N]eotest [F]ile",
		},
		{
			"<leader>ns",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "[N]eotest [S]ummary",
		},
		{
			"<leader>nl",
			function()
				require("neotest").run.run_last()
			end,
			desc = "[N]eotest [L]ast",
		},
	},
}
