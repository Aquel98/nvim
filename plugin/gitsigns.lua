require("gitsigns").setup({
   signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
   },
   current_line_blame = true,
   current_line_blame_opts = {
      virt_text = true,
      virtual_text_pos = "right_align",
      delay = 400,
      ignore_whitespace = false,
      use_focus = true,
   },
   on_attach = function (bufnr)
      local gitsigns = package.loaded.gitsigns

      local function map(mode, lhs, rhs, opts)
         opts = opts or {}
         opts.buffer = bufnr
         vim.keymap.set(mode, lhs, rhs, opts)
      end

      map("n", "gbl", function ()
             gitsigns.blame_line({ full = true })
          end, { desc = "Git blame line" })
      map("n", "gbf", function ()
             gitsigns.blame({})
          end, { desc = "Git blame file" })
   end,
})
