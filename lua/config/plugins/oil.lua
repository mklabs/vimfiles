---@diagnostic disable: undefined-doc-name
return {
  {
    "stevearc/oil.nvim",
    ---@module "oil"
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
    config = function()
      require("oil").setup({
        columns = { "icon" },
        view_options = { show_hidden = true }
      });

      -- Open parent directory in current window
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" });
    end
  }
};
