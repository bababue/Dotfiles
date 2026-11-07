--Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

--Tabs
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

--Scrolling
vim.opt.scrolloff = 8
--vim.opt.wrap = false

--Visual changes
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.showmode = false

--Backup and undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

--Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartcase = true

--Plugins
vim.g.mapleader = " "

--Window borders
vim.o.winborder = "rounded"

--Autoread (For ai workflows)
vim.o.autoread = true

--Fix latex detection error
vim.filetype.add({
	extension = {
		tex = "tex",
	},
})

vim.diagnostic.config({
	virtual_text = {
		severity = { min = vim.diagnostic.severity.WARN },
		spacing = 4,
		prefix = "»",
		source = "if_many",
	},

	signs = false,
	underline = true,
	update_in_insert = false,
	severity_sort = true,

	float = {
		focusable = true,
		style = "minimal",
	},
})

local markPrint = vim.api.nvim_create_augroup("MarkPrint", { clear = true })

vim.api.nvim_create_autocmd("MarkSet", {
	group = markPrint,
	callback = function(ev)
		print('Mark "' .. ev.data.name .. '" has been set in line', ev.data.line)
	end,
	desc = "Print mark on set",
})
