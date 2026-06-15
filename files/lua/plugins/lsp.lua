return {
	"neovim/nvim-lspconfig",
	version = "*",

	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		"saghen/blink.cmp",
		"b0o/schemastore.nvim",
	},

	config = function()
		local function map(buf, mode, keys, func, desc)
			vim.keymap.set(mode, keys, func, { buffer = buf, desc = "LSP: " .. desc })
		end

		local on_attach = function(event)
			local buf = event.buf
			local client = vim.lsp.get_client_by_id(event.data.client_id)

			if client and client:supports_method("textDocument/formatting", buf) then
				client.server_capabilities.documentFormattingProvider = false
			end
			if client and client:supports_method("textDocument/rangeFormatting", buf) then
				client.server_capabilities.documentRangeFormattingProvider = false
			end

			map(buf, "n", "grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
			map(buf, "n", "grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			map(buf, "n", "gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
			map(buf, "n", "grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
			map(buf, "n", "grt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Def")
			map(buf, "n", "gO", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
			map(buf, "n", "gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")

			map(buf, "n", "grn", vim.lsp.buf.rename, "[R]e[n]ame")
			map(buf, { "n", "x" }, "gra", vim.lsp.buf.code_action, "[C]ode [A]ction")

			if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, buf) then
				local highlight_group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

				vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					group = highlight_group,
					buffer = buf,
					callback = vim.lsp.buf.document_highlight,
				})
				vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					group = highlight_group,
					buffer = buf,
					callback = vim.lsp.buf.clear_references,
				})
				vim.api.nvim_create_autocmd("LspDetach", {
					group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
					callback = function()
						vim.lsp.buf.clear_references()
						vim.api.nvim_clear_autocmds({ group = highlight_group, buffer = buf })
					end,
				})
			end

			if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, buf) then
				map(buf, "n", "<leader>th", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }))
				end, "Toggle Inlay Hints")
			end
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = on_attach,
		})

		vim.diagnostic.config({
			severity_sort = true,
			underline = { severity = vim.diagnostic.severity.ERROR },
			float = { border = "rounded", source = "if_many" },
			signs = vim.g.have_nerd_font and {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			} or {},
			virtual_text = {
				source = "if_many",
				spacing = 2,
				format = function(d)
					local src = d.source or ""
					return string.format("[%s] %s", src, d.message)
				end,
			},
		})

		local capabilities = require("blink.cmp").get_lsp_capabilities()

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					completion = { callSnippet = "Replace" },
				},
			},
		})

		vim.lsp.config("basedpyright", {
			settings = {
				basedpyright = {
					analysis = {
						typeCheckingMode = "standard",
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
					},
				},
			},
		})

		vim.lsp.config("yamlls", {
			settings = {
				yaml = {
					schemaStore = { enable = false, url = "" },
					schemas = require("schemastore").yaml.schemas(),
					validate = true,
				},
			},
		})

		local servers = { "basedpyright", "lua_ls", "marksman", "ruff", "taplo", "yamlls" }
		local ensure = vim.list_extend(vim.deepcopy(servers), { "stylua" })

		require("mason-tool-installer").setup({ ensure_installed = ensure })

		require("mason-lspconfig").setup({
			automatic_enable = true,
		})
	end,
}
