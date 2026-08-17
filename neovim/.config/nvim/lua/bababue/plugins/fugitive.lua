return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>g", ":Git<Enter>", { desc = "Toggle git menu" })
	end,
}
