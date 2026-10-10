local config = {
   cmd = { "lua-language-server" },
   filetypes = { "lua" },
   root_markers = {
      ".emmyrc.json",
      ".luarc.json",
      ".luarc.jsonc",
      ".luacheckrc",
      ".stylua.toml",
      "stylua.toml",
      "selene.toml",
      "selene.yml",
      ".git",
   },
   settings = {
      Lua = {
         codeLens = { enable = true },
         hint = { enable = true, semicolon = "Disable" },
         completion = {
            callSnippet = "Replace",
         },
         -- Formatting through 'format' doesn't seem to work for the formatter used by lua_ls (EmmyLuaCodeStyle), however using the .editorconfig file seems to work. The editor config only applies to the current project.
         diagnostics = { globals = { "vim" } },
      },
   },
   capabilities = {
      textDocument = {
         completion = {
            completionItem = {
               snippetSupport = true,
            },
         },
      },
   },
}

config.capabilities = vim.tbl_deep_extend("force", require("lsp_capabilities"), config.capabilities)

return config
