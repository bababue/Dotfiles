return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "ruff" },
        javascript = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier" },
      },
      format_on_save = function()
        if not vim.g.format_on_save then
          return
        end
        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
    })
    vim.g.format_on_save = true
    vim.keymap.set("n", "<leader>u=", function()
      vim.g.format_on_save = not vim.g.format_on_save
      vim.notify("Format on save: " .. (vim.g.format_on_save and "ON" or "OFF"))
    end, { desc = "Toggle format on save" })
  end
}
