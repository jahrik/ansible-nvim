return {
	"saghen/blink.cmp",
	event = "VimEnter",
	version = "1.*",
	main = "blink.cmp",

	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = "make install_jsregexp",
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
			opts = {},
		},
		"folke/lazydev.nvim",
	},

	opts = {
		keymap = {
			-- Use Blink's default mappings:
			-- <C-Space> to trigger, <C-n>/<C-p> to navigate, <C-y> to confirm, etc.
			preset = "default",
		},

		appearance = {
			-- Use mono variant for better icon alignment (Nerd Font Mono)
			nerd_font_variant = "mono",
		},

		completion = {
			-- Show docs manually (<C-Space> when menu is open)
			documentation = { auto_show = true, auto_show_delay_ms = 500 },
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer", "lazydev", "dadbod" },
			providers = {
				lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
				dadbod = { module = "vim_dadbod_completion.blink", score_offset = 85 },
			},
		},

		-- Snippet support using LuaSnip
		snippets = { preset = "luasnip" },

		-- Fuzzy matching using Rust implementation
		fuzzy = {
			implementation = "rust",
		},

		-- Inline function signature help
		signature = { enabled = true },
	},
}
