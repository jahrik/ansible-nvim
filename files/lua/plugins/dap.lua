return {
	"mfussenegger/nvim-dap",
	version = "*",

	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mason-org/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"mfussenegger/nvim-dap-python",
		"theHamsta/nvim-dap-virtual-text",
	},

	keys = {
		{ "<leader>d", mode = { "n" }, group = "debug", desc = "+debug" },
		{
			"<leader>dd",
			function()
				require("dap").continue()
			end,
			desc = "Start / Continue",
		},
		{
			"<leader>di",
			function()
				require("dap").step_into()
			end,
			desc = "Step Into",
		},
		{
			"<leader>do",
			function()
				require("dap").step_over()
			end,
			desc = "Step Over",
		},
		{
			"<leader>du",
			function()
				require("dap").step_out()
			end,
			desc = "Step Out",
		},
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle Breakpoint",
		},
		{
			"<leader>dB",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Conditional Breakpoint",
		},
		{
			"<leader>dui",
			function()
				require("dapui").toggle()
			end,
			desc = "Toggle DAP UI",
		},
		{
			"<leader>dr",
			function()
				require("dap").repl.toggle()
			end,
			desc = "Toggle REPL",
		},
		{
			"<leader>dx",
			function()
				require("dap").terminate()
			end,
			desc = "Terminate Debugger",
		},
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			automatic_installation = true,
			ensure_installed = { "debugpy" },
			handlers = {},
		})

		dapui.setup({
			expand_lines = true,
			force_buffers = true,
			mappings = {
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
				toggle = "t",
			},
			element_mappings = {},
			layouts = {
				{
					elements = { { id = "scopes", size = 0.35 }, "breakpoints", "stacks", "watches" },
					size = 40,
					position = "left",
				},
				{
					elements = { "repl", "console" },
					size = 0.25,
					position = "bottom",
				},
			},
			floating = {
				border = "rounded",
				mappings = { close = { "q", "<Esc>" } },
			},
			render = { indent = 1 },
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				enabled = true,
				element = "repl",
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "↓",
					step_over = "→",
					step_out = "↑",
					step_back = "←",
					run_last = "↻",
					terminate = "■",
					disconnect = "⏏",
				},
			},
		})

		local mason_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
		require("dap-python").setup(mason_path)

		require("nvim-dap-virtual-text").setup({
			commented = true,
		})

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close
	end,
}
