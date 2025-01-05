return {
  {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",

    ---@module "blink.cmp"
    ---@diagnostic disable-next-line: undefined-doc-name
    ---@type blink.cmp.Config
    opts = {
      -- "default" for mappings similar to built-in completion
      -- "super-tab" for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- "enter" for mappings similar to "super-tab" but with "enter" to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = { preset = "super-tab" },
      --
      -- Insert completion item on selection, don't select by default
      -- list = { selection = 'auto_insert' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal"
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      signature = { enabled = true },

      completion = {

        keyword = { range = 'full' },

        -- Insert completion item on selection, don't select by default
        list = { selection = 'auto_insert' },

        menu = {
          -- nvim-cmp style menu
          draw = {
            columns = {
              { "label",     "label_description", gap = 1 },
              { "kind_icon", "kind" }
            },
          }
        },

        -- menu = { auto_show = function(ctx) return ctx.mode ~= 'cmdline' end },

        -- Show documentation when selecting a completion item
        documentation = { auto_show = true, auto_show_delay_ms = 500 },

        -- Display a preview of the selected item on the current line
        ghost_text = { enabled = true },
      },
    },
  }
};
