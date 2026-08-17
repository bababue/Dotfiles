return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.vimtex_quickfix_open_on_warning = 0

		vim.keymap.set("n", "<leader>lc", ":VimtexCompile<CR>", {
			desc = "Start latex compiler",
		})

		vim.keymap.set("n", "<leader>lv", ":VimtexView<CR>", {
			desc = "Jump to current latex position in PDF",
		})

		if vim.fn.has("macunix") == 1 then
			vim.g.vimtex_view_method = "skim"
		else
			vim.g.vimtex_view_method = "zathura_simple"
		end
	end,
}
