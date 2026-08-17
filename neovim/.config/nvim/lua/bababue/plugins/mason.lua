return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {},
			},
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"html",
					"cssls",
					"texlab",
					"marksman",
					"gopls",
					"clangd",
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = args.buf, desc = "LSP: Go to declaration" })
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf, desc = "LSP: Go to definition" })

					vim.keymap.set(
						"n",
						"gR",
						"<cmd>Telescope lsp_references<CR>",
						{ buffer = args.buf, desc = "LSP: Show references" }
					)
					vim.keymap.set(
						"n",
						"gi",
						"<cmd>Telescope lsp_implementations<CR>",
						{ buffer = args.buf, desc = "LSP: Show implementations" }
					)
					vim.keymap.set(
						"n",
						"gt",
						"<cmd>Telescope lsp_type_definitions<CR>",
						{ buffer = args.buf, desc = "LSP: Go to type definition" }
					)

					vim.keymap.set(
						{ "n", "v" },
						"<leader>ca",
						vim.lsp.buf.code_action,
						{ buffer = args.buf, desc = "LSP: Code action" }
					)
					vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, { buffer = args.buf, desc = "LSP: Rename symbol" })
				end,
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"prettier",
					"ruff",
				},
			})
		end,
	},
}
