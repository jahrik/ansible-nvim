return {
	"tpope/vim-dadbod",
	dependencies = {
		"kristijanhusak/vim-dadbod-ui",
		"kristijanhusak/vim-dadbod-completion",
	},
	cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
	keys = {
		{ "<leader>Du", "<cmd>DBUIToggle<cr>", desc = "[D]B [U]I toggle" },
		{ "<leader>Da", "<cmd>DBUIAddConnection<cr>", desc = "[D]B [A]dd connection" },
		{ "<leader>Df", "<cmd>DBUIFindBuffer<cr>", desc = "[D]B [F]ind buffer" },
	},
	init = function()
		vim.g.db_ui_use_nerd_icons = vim.g.have_nerd_font and 1 or 0
		vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui"
	end,
}
