return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {},
      },
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "html",
          "cssls",
          "texlab",
          "marksman",
          "gopls",
          "clangd",
          "oxlint",
          "vtsls",
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = args.buf, desc = "LSP: Go to declaration" })
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf, desc = "LSP: Go to definition" })
        end,
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",
          "prettier",
          "ruff",
        },
      })
    end,
  },
}
