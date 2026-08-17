return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({
			vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { desc = "Toggle zen mode" }),
			window = {
				options = {
					number = false,
					relativenumber = false,
				},
			},
			plugins = {
				tmux = { enabled = true },
				gitsigns = { enabled = true },
			},
		})
	end,
}
