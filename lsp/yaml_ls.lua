local config = {
   cmd = { "yaml-language-server", "--stdio" },
   filetypes = { "yaml"},
   capabilities = {},
   settings = {
      yaml = {
         format = {
            enable = true,
         },
         validate = true,
         hover = true,
         completion = true,
      },
   },
}

config.capabilities = vim.tbl_deep_extend("force", require("lsp_capabilities"), config.capabilities)

return config
