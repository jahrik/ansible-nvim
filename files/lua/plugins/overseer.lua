return {
	"stevearc/overseer.nvim",
	keys = {
		{ "<leader>o", group = "overseer", desc = "+Overseer" },
		{ "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run task" },
		{ "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle output" },
		{ "<leader>ol", "<cmd>OverseerRestartLast<cr>", desc = "Re-run last" },
		{ "<leader>oa", "<cmd>OverseerTaskAction<cr>", desc = "Task action" },
	},
	opts = {
		strategy = "terminal",
		templates = { "builtin", "user" },
		task_list = {
			direction = "bottom",
			default_detail = 1,
		},
	},
}
