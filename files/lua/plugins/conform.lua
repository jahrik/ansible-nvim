return {
	"stevearc/conform.nvim",
	version = "*",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },

	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = { "n", "v" },
			desc = "Format buffer",
		},
	},

	opts = {
		notify_on_error = false,

		format_on_save = function(bufnr)
			local disable_filetypes = { c = true, cpp = true }
			if disable_filetypes[vim.bo[bufnr].filetype] then
				return nil
			end
			return { timeout_ms = 1000, lsp_format = "fallback" }
		end,

		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "ruff_format" },
			sql = { "sqlfluff" },
			markdown = { "prettier" },
		},

		formatters = {
			ruff_format = {
				command = "ruff",
				args = {
					"format",
					"--line-length",
					"120",
					"--stdin-filename",
					"$FILENAME",
					"-",
				},
				stdin = true,
			},
			sqlfluff = {
				command = "sqlfluff",
				args = {
					"fix",
					"--dialect",
					"postgres",
					"--templater",
					"dbt",
					"--disable-progress-bar",
					"--stdin-filename",
					"$FILENAME",
					"-",
				},
				stdin = true,
			},
			prettier = {
				command = "prettier",
				args = { "--stdin-filepath", "$FILENAME" },
				stdin = true,
			},
		},
	},
}
