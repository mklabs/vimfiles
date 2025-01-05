return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      'saghen/blink.cmp',
    },

    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities();

      require("lspconfig").lua_ls.setup({
        globals = { "vim" },
        capabilities = capabilities
      });

      vim.keymap.set({ "n", "v", "i" }, "<C-A-cr>", vim.lsp.buf.format, { desc = "vim.lsp.buf.format()" })
      vim.keymap.set({ "n", "v" }, "<C-A-j>", vim.lsp.buf.format, { desc = "vim.lsp.buf.format()" })
      vim.keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "vim.lsp.buf.rename()" })
      vim.keymap.set({ "n", "x" }, "gra", vim.lsp.buf.code_action, { desc = "vim.lsp.buf.code_action()" })
      vim.keymap.set("n", "grr", vim.lsp.buf.references, { desc = "vim.lsp.buf.references()" })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local c = vim.lsp.get_client_by_id(args.data.client_id)
          if not c then return end

          if vim.bo.filetype == "lua" then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
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
