return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				python = { "ruff" },
				javascript = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true, -- falls kein Formatter definiert → LSP als Fallback
			},
		})
	end,
}
