return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"echasnovski/mini.nvim",
	},
	lazy = false,

	keys = {
		{ "\\", ":Neotree toggle reveal<CR>", desc = "NeoTree toggle", silent = true },
	},

	opts = {
		close_if_last_window = true, -- auto close Neo-tree if it's the last window open
		popup_border_style = "rounded",

		filesystem = {
			hijack_netrw_behavior = "open_default", -- replace netrw automatically
			follow_current_file = { enabled = true }, -- sync tree with the current buffer
			use_libuv_file_watcher = true, -- faster updates, less polling
			filtered_items = { visible = true }, -- show hidden files by default

			window = {
				position = "left",
				width = 32,
				mappings = {
					["\\"] = "close_window",
					["<space>"] = "none", -- prevent accidental file opening on <space>
				},
			},
		},

		default_component_configs = {
			indent = { with_expanders = true }, -- nicer folding arrows
			icon = {
				folder_closed = "",
				folder_open = "",
				default = "",
				provider = function(icon, node)
					if node.type == "file" then
						icon.text, icon.highlight = require("mini.icons").get("file", node.name)
					end
				end,
			},
			git_status = {
				symbols = {
					added = "",
					deleted = "",
					modified = "",
					renamed = "",
					untracked = "",
					ignored = "",
					unstaged = "",
					staged = "",
					conflict = "",
				},
			},
		},

		-- Auto close Neo-tree & focus file when opening
		event_handlers = {
			{
				event = "file_opened",
				handler = function(file_path)
					-- Close all Neo-tree windows
					require("neo-tree.command").execute({ action = "close" })
					-- Ensure focus jumps into the opened buffer
					vim.schedule(function()
						vim.cmd("wincmd p") -- go to the previous (non-tree) window
					end)
				end,
			},
		},
	},
}
