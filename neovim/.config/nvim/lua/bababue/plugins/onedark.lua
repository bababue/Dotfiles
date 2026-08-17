return {
	"navarasu/onedark.nvim",
	enabled = true,
	priority = 1000,
	config = function()
		require("onedark").setup({
			style = "darker",
		})
	end,
}
