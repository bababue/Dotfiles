return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		branch = "main",

		config = function()
			require("nvim-treesitter").setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
				ensure_installed = { "markdown", "markdown_inline" },
			})

			vim.keymap.set("", "ö", "<CMD>Telescope find_files<CR>", { remap = true })
			vim.keymap.set("", "Ö", "<CMD>Telescope live_grep<CR>", { remap = true })

			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "*" },
				callback = function()
					local ok = pcall(vim.treesitter.start)
					if ok then
						vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		lazy = false,
	},
}
