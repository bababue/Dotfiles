return {
	"tpope/vim-dadbod",
	"kristijanhusak/vim-dadbod-completion",
	{
		"kristijanhusak/vim-dadbod-ui",
		config = function()
			vim.api.nvim_create_user_command("Sql", "DBUI", {})
			-- vim.g.db_ui_execute_on_save = 0
		end,
	},
}
