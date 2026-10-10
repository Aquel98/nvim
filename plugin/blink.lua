require("blink.cmp").setup({
      keymap = {
         preset = "enter",
      },
      appearance = {
         nerd_font_variant = "normal",
      },
      completion = {
         menu = {
            border = "single"
         },
         documentation = {
            auto_show = true,
            auto_show_delay_ms = 0,
            window = {
               border = "single"
            },
         },
      },
      sources = {
         default = { "lsp", "path", "snippets", "lazydev" },
         providers = {
            lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
         },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = {
         enabled = true,
         window = {
            border = "single"
         },
      },
})
