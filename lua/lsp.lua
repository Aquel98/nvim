vim.lsp.enable({
   "clangd",
   "ruff",
   "basedpyright",
   "lua_ls",
   "typos_lsp",
   "yaml_ls",
})

-- LSP logging, to see where it gets saved, enter the command ":lua print(vim.lsp.get_log_path())"
vim.lsp.log.set_level("off")

-- Diagnostics
vim.diagnostic.config({
   severity_sort = true,
   float = { border = "rounded", source = "if_many" },
   underline = { severity = vim.diagnostic.severity.ERROR },
   signs = vim.g.have_nerd_font and {
      text = {
         [vim.diagnostic.severity.ERROR] = "󰅚 ",
         [vim.diagnostic.severity.WARN] = "󰀪 ",
         [vim.diagnostic.severity.INFO] = "󰋽 ",
         [vim.diagnostic.severity.HINT] = "󰌶 ",
      },
   } or {},
   virtual_text = {
      source = "if_many",
      spacing = 2,
      format = function (diagnostic)
         local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
         }
         return diagnostic_message[diagnostic.severity]
      end,
   },
})

-- Add more capabilities from blink.cmp.
local capabilities = require("blink.cmp").get_lsp_capabilities()
vim.lsp.config("*", { capabilities = capabilities })
