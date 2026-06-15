return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{ "<leader>a", mode = { "n", "v" }, group = "ai", desc = "+AI" },
		{ "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle chat" },
		{ "<leader>ai", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Actions menu" },
		{ "<leader>aa", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add to chat" },
		{ "<leader>ap", "<cmd>CodeCompanion<cr>", mode = { "n", "v" }, desc = "Inline prompt" },
	},
	opts = {
		strategies = {
			chat = { adapter = "copilot" },
			inline = { adapter = "copilot" },
		},
		display = {
			chat = {
				render_headers = false,
			},
		},
	},
}
