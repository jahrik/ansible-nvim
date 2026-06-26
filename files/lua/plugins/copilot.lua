return {
	"zbirenbaum/copilot.lua",
	branch = "master",
	cmd = "Copilot",
	event = "InsertEnter",

	opts = {
		panel = {
			enabled = false, -- disable Copilot side panel
		},
		suggestion = {
			enabled = true, -- enable inline ghost text
			auto_trigger = true, -- automatically show suggestions as you type
			debounce = 150, -- small delay for smoother behavior
			keymap = {
				accept = "<M-y>", -- Option + Y to accept full suggestion
				accept_word = false,
				accept_line = false,
				next = "<M-n>", -- Option + N for next suggestion
				prev = "<M-p>", -- Option + P for previous suggestion
				dismiss = "<C-]>", -- Ctrl + ] to dismiss
			},
		},
		filetypes = {
			["*"] = true, -- enable globally
		},
	},

	keys = {
		{ "<leader>ce", "<cmd>Copilot enable<cr>", desc = "[C]opilot [E]nable" },
		{ "<leader>cd", "<cmd>Copilot disable<cr>", desc = "[C]opilot [D]isable" },
		{ "<leader>cs", "<cmd>Copilot status<cr>", desc = "[C]opilot [S]tatus" },
		{ "<leader>cp", "<cmd>Copilot panel<cr>", desc = "[C]opilot [P]anel" },
	},
}
