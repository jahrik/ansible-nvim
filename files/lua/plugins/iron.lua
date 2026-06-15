return {
	"Vigemus/iron.nvim",
	keys = {
		{ "<leader>r", mode = { "n", "v" }, group = "repl", desc = "+REPL" },
		{
			"<leader>rs",
			function()
				require("iron.core").repl_for(vim.bo.filetype)
			end,
			desc = "Start REPL",
		},
		{
			"<leader>rq",
			function()
				require("iron.core").close_repl(vim.bo.filetype)
			end,
			desc = "Quit REPL",
		},
		{
			"<leader>rc",
			function()
				require("iron.core").send(vim.bo.filetype, string.char(12))
			end,
			desc = "Clear REPL",
		},
		{
			"<leader>rl",
			function()
				require("iron.core").send_line()
			end,
			desc = "Send line",
		},
		{
			"<leader>rf",
			function()
				require("iron.core").send_file()
			end,
			desc = "Send file",
		},
		{
			"<leader>rv",
			function()
				require("iron.core").visual_send()
			end,
			mode = "v",
			desc = "Send selection",
		},
		{
			"<leader>rb",
			function()
				require("iron.core").send_until_cursor()
			end,
			desc = "Send cell block",
		},
		{
			"<leader>rm",
			function()
				require("iron.core").send_motion()
			end,
			desc = "Send motion",
		},
	},

	config = function()
		require("iron.core").setup({
			config = {
				repl_definition = {
					python = {
						command = function()
							if vim.fn.executable("ipython") == 1 then
								return { "ipython", "--no-autoindent" }
							end
							return { "python3" }
						end,
					},
					sql = { command = { "psql" } },
				},
				repl_open_cmd = "vertical botright 80 split",
				buflisted = false,
			},
			keymaps = {},
		})
	end,
}
