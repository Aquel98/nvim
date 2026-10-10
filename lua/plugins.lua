vim.api.nvim_create_autocmd("PackChanged", {
   pattern = "blink.cmp",
   group = vim.api.nvim_create_augroup("blink_update", {clear = true}),
   callback = function(event)
      if event.data.kind == "update" or event.data.kind == "install" then
         local cmp = require("blink.cmp")
         cmp.build():pwait()
      end
   end,
})

local packages = {
   {
      src = "https://github.com/lewis6991/gitsigns.nvim",
      name = "gitsigns",
      version = "main",
   },
   {
      src = "https://github.com/folke/snacks.nvim",
      name = "snacks",
      version = "main",
   },
   {
      src = "https://github.com/folke/which-key.nvim",
      name = "which-key",
      version = "main",
   },
   {
      src = "https://github.com/folke/lazydev.nvim",
      name = "lazydev",
      version = "main",
   },
   {
      src = "https://github.com/j-hui/fidget.nvim",
      name = "fidget",
      version = "main",
   },
   {
      src = "https://github.com/stevearc/conform.nvim",
      name = "conform",
      version = "master",
   },
   {
      src = "https://github.com/saghen/blink.lib",
      name = "blinklib",
      version = "v1.10.2",
   },
   {
      src = "https://github.com/saghen/blink.cmp",
      name = "blink.cmp",
      version = "v1.10.2",
   },
   {
      src = "https://github.com/folke/tokyonight.nvim",
      name = "tokyonight",
      version = "main",
   },
   {
      src = "https://github.com/folke/todo-comments.nvim",
      name = "todo-comments",
      version = "main",
   },
   {
      src = "https://github.com/echasnovski/mini.nvim",
      name = "mini",
      version = "main",
   },
   {
      src = "https://github.com/nvim-treesitter/nvim-treesitter",
      name = "treesitter",
      version = "main",
   },
   {
      src = "https://github.com/MagicDuck/grug-far.nvim",
      name = "grug-far",
      version = "main",
   },
}

vim.pack.add(packages, {
   load = true,
   confirm = false,
})

local package_names = {}
for _, pkg in ipairs(packages) do
   table.insert(package_names, pkg.name)
end

local installed_packages = vim.pack.get(nil, { info = false })
local installed_package_names = {}
for _, pkg in ipairs(installed_packages) do
   table.insert(installed_package_names, pkg.spec.name)
end

local uninstall_packages = {}

for _, name in ipairs(installed_package_names) do
   local found = false
   for _, pkg in ipairs(package_names) do
      if name == pkg then
         found = true
         break
      end
   end
   if not found then
      table.insert(uninstall_packages, name)
   end
end

if next(uninstall_packages) ~= nil then
   vim.pack.del(uninstall_packages)
end
