return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      {
        -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins used for completion, annotations and signatures of Neovim apis
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            -- Load luvit types when the `vim.uv` word is found
            -- { path = "luvit-meta/library",      words = { "vim%.uv" } },
            -- { path = "/usr/share/awesome/lib/", words = { "awesome" } },
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      "saghen/blink.cmp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },

    config = function()
      local lsp = require("lspconfig");
      local blink_capabilities = require("blink.cmp").get_lsp_capabilities();

      -- Lua
      lsp.lua_ls.setup({
        capabilities = blink_capabilities,
      })

      -- lsp.lua_ls.setup

      -- Html
      --Enable (broadcasting) snippet capability for completion
      local capabilities = vim.lsp.protocol.make_client_capabilities();
      capabilities.textDocument.completion.completionItem.snippetSupport = true;
      lsp.html.setup({ capabilities = capabilities });

      -- Astro
      lsp.astro.setup({})

      -- typescript
      lsp.ts_ls.setup({})

      vim.keymap.set({ "n", "v", "i" }, "<C-A-cr>", vim.lsp.buf.format, { desc = "vim.lsp.buf.format()" })
      vim.keymap.set({ "n", "v" }, "<C-A-j>", vim.lsp.buf.format, { desc = "vim.lsp.buf.format()" })
      vim.keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "vim.lsp.buf.rename()" })
      vim.keymap.set({ "n", "x" }, "gra", vim.lsp.buf.code_action, { desc = "vim.lsp.buf.code_action()" })
      vim.keymap.set("n", "grr", vim.lsp.buf.references, { desc = "vim.lsp.buf.references()" })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local c = vim.lsp.get_client_by_id(args.data.client_id)
          if not c then return end

          if vim.bo.filetype == "lua" then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
              end,
            })
          end
        end,
      })
    end
  }
};
