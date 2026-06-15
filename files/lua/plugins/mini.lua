return {
	"echasnovski/mini.nvim",
	version = "*",
	lazy = false,
	config = function()
		local starter = require("mini.starter")
		starter.setup({
			header = table.concat({
				"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
				"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
				"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
				"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
				"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
				"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
			}, "\n"),
			items = {
				{ name = "f  Find file", action = "Telescope find_files", section = "Actions" },
				{ name = "r  Recent files", action = "Telescope oldfiles", section = "Actions" },
				{ name = "g  Live grep", action = "Telescope live_grep", section = "Actions" },
				{ name = "n  New file", action = "enew", section = "Actions" },
				{ name = "l  Lazy", action = "Lazy", section = "Actions" },
				{ name = "q  Quit", action = "qa", section = "Actions" },
				starter.sections.recent_files(5, true, false),
			},
			footer = function()
				local stats = require("lazy").stats()
				return "⚡ " .. stats.loaded .. "/" .. stats.count .. " plugins loaded"
			end,
			query_updaters = "",
			content_hooks = {
				starter.gen_hook.adding_bullet(),
				starter.gen_hook.aligning("center", "center"),
			},
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniStarterOpened",
			callback = function(ev)
				local buf = ev.buf
				vim.keymap.set("n", "j", function()
					MiniStarter.update_current_item("next")
				end, { buffer = buf })
				vim.keymap.set("n", "k", function()
					MiniStarter.update_current_item("prev")
				end, { buffer = buf })
				vim.keymap.set("n", "\\", function()
					MiniStarter.close()
					vim.cmd("Neotree toggle")
				end, { buffer = buf })
			end,
		})
		require("mini.ai").setup({ n_lines = 500 })
		require("mini.icons").setup({
			filetype = {
				yaml = { glyph = "", hl = "MiniIconsPurple" },
			},
		})
		MiniIcons.mock_nvim_web_devicons()
		require("mini.pairs").setup()
		require("mini.surround").setup()

		local statusline = require("mini.statusline")
		statusline.setup({ use_icons = vim.g.have_nerd_font })

		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end
	end,
}
