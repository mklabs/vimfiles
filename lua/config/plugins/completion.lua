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
      -- keymap = { preset = "super-tab" },
      -- keymap = { preset = "enter" },

      cmdline = {
        keymap = {
          preset = 'default',
        }
      },

      keymap = {
        preset = 'super-tab',

        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          'snippet_forward',
          'fallback'
        }
      },

      -- Insert completion item on selection, don't select by default
      -- list = { selection = 'auto_insert' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal"
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },

        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },

      signature = { enabled = true },

      completion = {

        keyword = { range = 'full' },

        -- Insert completion item on selection, don't select by default
        list = {
          -- selection = { preselect = true, auto_insert = true }
          -- selection = {
          --   preselect = function(ctx) return ctx.mode ~= 'cmdline' end,
          --   auto_insert = function(ctx) return ctx.mode ~= 'cmdline' end
          -- }
        },

        menu = {
          -- nvim-cmp style menu
          draw = {
            columns = {
              { "label",     "label_description", gap = 1 },
              { "kind_icon", "kind" }
            },
          },
          -- auto_show = function(ctx) return ctx.mode ~= 'cmdline' end
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
