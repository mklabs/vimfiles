return {
  -- Autocompletion
  'saghen/blink.cmp',
  build = 'cargo build --release',
  lazy = true,
  event = { "InsertEnter", "CmdLineEnter" },
  dependencies = {
    "rafamadriz/friendly-snippets",
    {
        "L3MON4D3/LuaSnip",
         config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
          end,
    },
    "folke/lazydev.nvim",
    {
        'taku25/blink-cmp-unreal',
    },
  },
  opts = {
      keymap = {
        preset = "super-tab",
      },
      completion = {
        trigger = {
            show_in_snippet = false,
        },
        list = {
            selection = {
                preselect = false
            },
        },
        documentation = {
          auto_show = true
        }
      },
      sources = {
          default = {
              "snippets", "lsp", "path", "buffer", "lazydev", "unreal",
          },
          providers = {
              lazydev = {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                score_offset = 100,
              },
             unreal = {
                module = 'blink-cmp-unreal',
                name = 'unreal',
                score_offset = 10,
             },
          },
      },
      snippets = { preset = "luasnip" },
  },
  opts_extend = { "sources.default" },
}
