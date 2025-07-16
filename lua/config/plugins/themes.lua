local default_theme = "catppuccin";

return {
  { "folke/tokyonight.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.cmd.colorscheme(default_theme);
    end
  },
};
