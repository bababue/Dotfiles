return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			columns = { "icon" },
			keymaps = {
				["<C-h>"] = false,
				["gh"] = { "actions.select", opts = { horizontal = true } },

				["<C-l>"] = false,
				["gl"] = "actions.refresh",
			},
			view_options = {},
		})
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory in file explorer" })
	end,
}
