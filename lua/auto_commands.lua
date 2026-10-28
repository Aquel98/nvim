-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
   desc = "Highlight when yanking",
   group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
   callback = function ()
      vim.hl.on_yank({ timeout = 300 })
   end,
})

-- Some functions to be run when an LSP attaches to a buffer
-- Disable ruff hover in favor for basedpyright
vim.api.nvim_create_autocmd("LspAttach", {
   group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
   callback = function (event)
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if client == nil then
         return
      end
      if client.name == "ruff" then
         -- Disable hover in favor for basedpyright
         client.server_capabilities.hoverProvider = false
      end

      -- Create a mapping function for keymaps
      local map = function (keys, func, desc, mode)
         mode = mode or "n"
         vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
      end

      -- Rename variable under cursor
      map("grn", vim.lsp.buf.rename, "Rename")
      -- Perform code action (like fixing a diagnostic issue)
      map("gra", vim.lsp.buf.code_action, "Go to code action")
      if client.name == "clangd" then
         -- Switch source/header
         map("grs", vim.cmd.LspClangdSwitchSourceHeader, "Switch source/header")
      end

      -- Highlight references to word under cursor after delay
      if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
         local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
         vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
         })

         vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
         })

         vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
            callback = function (event2)
               vim.lsp.buf.clear_references()
               vim.spi.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
            end,
         })
      end

      -- Toggle inlay hints
      if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
         map("<leader>th", function ()
                vim.lsp.inlay_int.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
             end, "Toggle inlay hints")
      end
   end,
})
