return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	main = "nvim-treesitter",

	opts = {
		ensure_installed = {
			"bash",
			"c",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"sql",
			"vim",
			"vimdoc",
			"yaml",
			"json",
			"toml",
		},

		auto_install = true,
	},
}
