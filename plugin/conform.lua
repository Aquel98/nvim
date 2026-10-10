require("conform").setup({
   notify_on_error = true,
   formatters_by_ft = {
      lua = { lsp_format = "prefer" },
      c = { "clang-format", lsp_format = "fallback" },
      cpp = { "clang-format", lsp_format = "fallback" },
   },
})
vim.keymap.set("n", "<leader>f",
               function ()
                  require("conform").format({ async = true, lsp_format = "fallback" })
               end,
               { desc = "Format buffer" })
