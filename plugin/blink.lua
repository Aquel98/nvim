require("blink.cmp").setup({
      keymap = {
         preset = "enter",
      },
      appearance = {
         nerd_font_variant = "normal",
      },
      completion = {
         documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },
      sources = {
         default = { "lsp", "path", "snippets", "lazydev" },
         providers = {
            lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
         },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { enabled = true },
})
