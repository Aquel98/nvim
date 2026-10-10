local config = {
   cmd = { "typos-lsp" },
   cmd_env = { RUST_LOG = "typos_lsp=error" },
   init_options = {
      diagnosticsSeverity = "Hint",
   },
   root_markers = { "_typos.toml", "typos.toml", ".typos.toml", ".git" },
   capabilities = {},
   docs = {
      description = [[
https://github.com/tekumara/typos-lsp
]],
   },
}

config.capabilities = vim.tbl_deep_extend("force", require("lsp_capabilities"), config.capabilities)

return config
