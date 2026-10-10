require("mini.ai").setup({
   n_lines = 500
})

require("mini.surround").setup()

require("mini.sessions").setup()

local map = require("mini.map")
map.setup({
   integrations = { map.gen_integration.builtin_search(), map.gen_integration.gitsigns(), map.gen_integration.diagnostic() },
   symbols = { encode = map.gen_encode_symbols.dot("4x2"), },
})

-- Keymaps for MiniMap
vim.keymap.set("n", "<Leader>mc", map.close, { desc = "Close MiniMap" })
vim.keymap.set("n", "<Leader>mf", map.toggle_focus, { desc = "MiniMap toggle focus" })
vim.keymap.set("n", "<Leader>mo", map.open, { desc = "Open MiniMap" })
vim.keymap.set("n", "<Leader>mr", map.refresh, { desc = "Refresh MiniMap" })
vim.keymap.set("n", "<Leader>ms", map.toggle_side, { desc = "MiniMap toggle side" })
vim.keymap.set("n", "<Leader>mt", map.toggle, { desc = "Toggle MiniMap" })

for _, key in ipairs({ "n", "N", "*", "#" }) do
   local rhs = key ..
       "<Cmd>lua MiniMap.refresh({}, {lines = false, scrollbar = false})<CR>"
   vim.keymap.set("n", key, rhs)
end

-- To open MiniMap on startup
vim.api.nvim_create_autocmd({ "VimEnter" }, {
   callback = function()
      map.open()
   end,
})

local statusline = require("mini.statusline")
statusline.setup({
   use_icons = vim.g.have_nerd_font,
})
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
   return "%2l/%2L:%-2v"
end
