--Space as leader key
vim.g.mapleader = " "

--Custom keybinds
vim.keymap.set("", "ü", "[", { remap = true })
vim.keymap.set("", "ä", "]", { remap = true })

vim.keymap.set("", "Ü", "{", { remap = true })
vim.keymap.set("", "Ä", "}", { remap = true })

vim.keymap.set("", "ß", "$", { remap = true })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Perform a centered jump up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Perform a centered jump down" })

vim.keymap.set("n", "Y", "y$", { desc = "Yank to the end the line" })

vim.keymap.set("", "<leader>d", '"_d', { desc = "Delete without buffering" })
vim.keymap.set("", "<leader>D", '"_D', { desc = "Delete without buffering" })

vim.keymap.set("", "<leader>c", '"_d', { desc = "Change without buffering" })
vim.keymap.set("n", "<leader>=", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format current buffer" })
vim.keymap.set("", "<leader>C", '"_D', { desc = "Change without buffering" })

vim.keymap.set("", "<leader>y", '"+y', { desc = "Yank into system clipboard" })
vim.keymap.set("", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("", "<leader>P", '"+P', { desc = "Paste from system clipboard" })

vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Execute selection with lua" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Execute current line with lua" })
vim.keymap.set("n", "<leader>X", "<CMD>source %<CR>", { desc = "Execute current line with lua" })

vim.keymap.set("n", "<leader>a", "gg0vG$")

--Quickfix
vim.keymap.set("n", "<Leader>q", function()
	local windows = vim.fn.getwininfo()
	for _, win in pairs(windows) do
		if win["quickfix"] == 1 then
			vim.cmd.cclose()
			return
		end
	end
	vim.cmd.copen()
end, { desc = "Open Quickfix" })

vim.keymap.set("n", "]q", ":cnext<CR>", { desc = "Next Quickfix" })
vim.keymap.set("n", "[q", ":cprev<CR>", { desc = "Prev Quickfix" })

vim.keymap.set("n", "<leader>t", vim.diagnostic.setqflist, { desc = "Add diagnostics to quickfix list" })

vim.keymap.set("n", "<leader>r", function()
	vim.cmd("w")
	local ft = vim.bo.filetype
	if ft == "python" then
		vim.cmd("!python3 %")
	elseif ft == "go" then
		vim.cmd("!go run %")
	elseif ft == "sh" then
		vim.cmd("!./%")
	else
		print("No runner configured for " .. ft)
	end
end, { desc = "Run current file" })
