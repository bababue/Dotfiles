--Space as leader key
vim.g.mapleader = " "

--Customization for german layout
vim.keymap.set("", "ü", "[", { remap = true })
vim.keymap.set("", "ä", "]", { remap = true })
vim.keymap.set("", "Ü", "{", { remap = true })
vim.keymap.set("", "Ä", "}", { remap = true })

--No paragraph jumps into jumplist
for _, motion in ipairs({ "{", "}" }) do
  vim.keymap.set({ "n", "x" }, motion, function()
    vim.cmd("keepjumps normal! " .. vim.v.count1 .. motion)
  end, { desc = "Paragraph jump without jumplist entry" })
end

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Perform a centered jump up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Perform a centered jump down" })

vim.keymap.set("", "<leader>d", '"_d', { desc = "Delete without buffering" })
vim.keymap.set("", "<leader>D", '"_D', { desc = "Delete without buffering" })

vim.keymap.set("", "<leader>c", '"_c', { desc = "Change without buffering" })
vim.keymap.set("", "<leader>C", '"_C', { desc = "Change without buffering" })

vim.keymap.set("", "<leader>y", '"+y', { desc = "Yank into system clipboard" })
vim.keymap.set("", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("", "<leader>P", '"+P', { desc = "Paste from system clipboard" })

vim.keymap.set("n", "<leader>=", function()
  require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format current buffer" })


vim.keymap.set("n", "<leader>a", "gg0vG$", { desc = "Select entire content of buffer" })

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
vim.keymap.set("n", "<leader>e", vim.diagnostic.setqflist, { desc = "Add diagnostics to quickfix list" })

--Tabs
vim.keymap.set("n", "<leader>t", "<Cmd>tab split<CR>", { desc = "Open current file in new tab" })
vim.keymap.set("n", "<leader>T", "<Cmd>tab close<CR>", { desc = "Close current tab" })

--Run different scripts
vim.keymap.set("n", "<leader>x", function()
  vim.cmd("w")
  local ft = vim.bo.filetype
  if ft == "python" then
    vim.cmd("!python3 %")
  elseif ft == "go" then
    vim.cmd("!go run %")
  elseif ft == "sh" then
    vim.cmd("!./%")
  elseif ft == "lua" then
    vim.cmd.source(vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)))
  else
    print("No runner configured for " .. ft)
  end
end, { desc = "Run current file" })

vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Execute selection with lua" })
