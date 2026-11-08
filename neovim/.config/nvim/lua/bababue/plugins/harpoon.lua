return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("telescope").load_extension("harpoon")

    vim.keymap.set("n", "<leader>ha", function()
      require("harpoon.mark").add_file()
    end, { desc = "Add file to harpoon" })

    vim.keymap.set("n", "<leader>hm", function()
      require("harpoon.ui").toggle_quick_menu()
    end, { desc = "Toggle harpoon menu" })

    for index = 1, 9 do
      vim.keymap.set("n", "<leader>" .. index, function()
        require("harpoon.ui").nav_file(index)
      end, { desc = "Switch to harpoon " .. index })
    end
  end,
}
