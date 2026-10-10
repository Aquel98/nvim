require("snacks").setup({
      bigfile = { enabled = false },
      dashboard = { enabled = false},
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = false },
      picker = { enabled = true },
      lazygit = { enabled = true },
      notifier = { enabled = false },
      quickfile = { enabled = false },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
})
vim.keymap.set("n",
   "<leader>sf",
      function()
         Snacks.picker.files()
      end,
      {desc = "Find files"})
vim.keymap.set({"n", "x"},
         "<leader>sw",
         function()
            Snacks.picker.grep_word()
         end,
         {desc = "Visual selection or word"})
vim.keymap.set("n",
         "<leader>sg",
         function()
            Snacks.picker.grep()
         end,
         {desc = "Grep"})
vim.keymap.set("n",
         "<leader>e",
         function()
            Snacks.explorer()
         end,
{desc = "File explorer"})
vim.keymap.set("n",
         "<leader>E",
         function()
            Snacks.explorer.reveal()
         end,
{desc = "File explorer"})
vim.keymap.set("n",
         "<leader>lg",
         function()
            Snacks.lazygit()
         end,
{desc = "Lazygit"})
vim.keymap.set("n",
         "<leader>sd",
         function()
            Snacks.picker.diagnostics()
         end,
{desc = "Diagnostics"})
vim.keymap.set("n",
         "<leader>sh",
         function()
            Snacks.picker.help()
         end,
{desc = "Help pages"})
vim.keymap.set("n",
         "<leader>sr",
         function()
            Snacks.picker.resume()
         end,
{desc = "Resume"})
vim.keymap.set("n",
         "gd",
         function()
            Snacks.picker.lsp_definitions()
         end,
{desc = "Go to definition"})
vim.keymap.set("n",
         "gD",
         function()
            Snacks.picker.lsp_declarations()
         end,
{desc = "Go to declaration"})
vim.keymap.set("n",
         "grr",
         function()
            Snacks.picker.lsp_references()
         end,
{nowait = true,
         desc = "References"})
vim.keymap.set("n",
         "gI",
         function()
            Snacks.picker.lsp_implementations()
         end,
{desc = "Go to Implementation"})
vim.keymap.set("n",
         "gt",
         function()
            Snacks.picker.lsp_type_definitions()
         end,
{desc = "Go to type definition"})
vim.keymap.set("n",
         "<leader>ss",
         function()
            Snacks.picker.lsp_symbols()
         end,
         {desc = "LSP symbols"})
vim.keymap.set("n",
         "<leader>sS",
         function()
            Snacks.picker.lsp_workspace_symbols()
         end,
{desc = "LSP workspace symbols"})
vim.keymap.set("n",
         "<leader>sk",
         function()
            Snacks.picker.keymaps()
         end,
{desc = "Keymaps"
      })
vim.keymap.set("n",
         "<leader>s.",
         function()
            Snacks.picker.recent()
         end,
{desc = "Recent"})
vim.keymap.set("n",
   "<leader>sn",
   function()
      Snacks.picker.files({cwd = vim.fn.stdpath("config")})
   end,
      {desc = "Find neovim config files"})
