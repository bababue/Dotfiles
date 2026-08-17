return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = require("telescope.actions").move_selection_previous, -- move to prev result
						["<C-j>"] = require("telescope.actions").move_selection_next, -- move to next result
					},
				},
				extentions = {
					fzf = {},
				},
			},
		})

		require("telescope").load_extension("fzf")

		vim.keymap.set("n", "ö", require("telescope.builtin").find_files, { desc = "Fuzzy find files" })
		vim.keymap.set("n", "Ö", require("telescope.builtin").live_grep, { desc = "Grep current directory" })
		vim.keymap.set("n", "<leader>fk", require("telescope.builtin").keymaps, { desc = "Fuzzy find available keybinds" })
		vim.keymap.set("n", "<leader>fd", ":Telescope fd find_command=fd,-t=d<CR>", { desc = "Fuzzy find directories" })

		vim.keymap.set("n", "<leader>fc", function()
			require("telescope.builtin").find_files({
				cwd = vim.fn.stdpath("config"),
			})
		end, { desc = "Fuzzy find inside neovim config" })

		vim.keymap.set("n", "<leader>fC", function()
			require("telescope.builtin").live_grep({
				cwd = vim.fn.stdpath("config"),
			})
		end, { desc = "Grep inside neovim config" })

		vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Fuzzy find help tags" })
	end,
}
