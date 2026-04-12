---@diagnostic disable: undefined-doc-name
return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function()
      local oil = require("oil")
      oil.setup({
        columns = { "icon" },
        review_split = "auto",
        view_options = { show_hidden = true },
        keymaps = {
          ["<C-o>"] = "actions.preview",
          ["<C-d>"] = "actions.preview_scroll_down",
          ["<C-u>"] = "actions.preview_scroll_up",
          -- ["g?"] = { "actions.show_help", mode = "n" },
          -- ["<CR>"] = "actions.select",
          -- ["<C-s>"] = { "actions.select", opts = { vertical = true } },
          -- ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
          -- ["<C-t>"] = { "actions.select", opts = { tab = true } },
          -- ["<C-c>"] = { "actions.close", mode = "n" },
          -- ["<C-l>"] = "actions.refresh",
          -- ["-"] = { "actions.parent", mode = "n" },
          -- ["_"] = { "actions.open_cwd", mode = "n" },
          -- ["`"] = { "actions.cd", mode = "n" },
          -- ["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
          -- ["gs"] = { "actions.change_sort", mode = "n" },
          -- ["gx"] = "actions.open_external",
          -- ["g."] = { "actions.toggle_hidden", mode = "n" },
          -- ["g\\"] = { "actions.toggle_trash", mode = "n" },
        },
        -- Configuration for the file preview window
        preview_win = {
          -- Whether the preview window is automatically updated when the cursor is moved
          update_on_cursor_moved = true,
          -- How to open the preview window "load"|"scratch"|"fast_scratch"
          preview_method = "fast_scratch",
          -- A function that returns true to disable preview on a file e.g. to avoid lag
          disable_preview = function(filename)
            return false
          end,
          -- Window-local options to use for preview window buffers
          win_options = {},
        },
      })

      -- Open parent directory in current window
      vim.keymap.set("n", "-", function()
        oil.open(nil, { preview = {} })
      end, { desc = "Open parent directory" })
    end,
  },
}
