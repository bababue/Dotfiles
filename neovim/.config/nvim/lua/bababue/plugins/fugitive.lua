return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gm", ":Git<Enter>", { desc = "Toggle git menu" })
	end,
}
