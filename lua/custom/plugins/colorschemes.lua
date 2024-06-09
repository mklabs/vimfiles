-- You can easily change to a different colorscheme.
-- Change the name of the colorscheme plugin below, and then
-- change the command in the config to whatever the name of that colorscheme is.
--
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.

return {
  {
    -- lazy = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    'tjdevries/colorbuddy.nvim',
    config = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'tokyonight-night'
      -- vim.cmd.colorscheme 'tokyonight-storm'
      -- vim.cmd.colorscheme 'tokyonight-moon'
      -- vim.cmd.colorscheme 'gruvbuddy'
      -- vim.cmd.colorscheme 'base16-nord'
      vim.cmd.colorscheme 'onedark'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  'joshdick/onedark.vim',
  'folke/tokyonight.nvim',
  'rktjmp/lush.nvim',
  'tckmn/hotdog.vim',
  'dundargoc/fakedonalds.nvim',
  'craftzdog/solarized-osaka.nvim',
  { 'rose-pine/neovim', name = 'rose-pine' },
  'eldritch-theme/eldritch.nvim',
  'jesseleite/nvim-noirbuddy',
  'vim-scripts/MountainDew.vim',
  'miikanissi/modus-themes.nvim',
  'rebelot/kanagawa.nvim',
  'gremble0/yellowbeans.nvim',
  'rockyzhang24/arctic.nvim',
  'folke/tokyonight.nvim',
  'Shatur/neovim-ayu',
  'RRethy/base16-nvim',
  'xero/miasma.nvim',
  'cocopon/iceberg.vim',
  'kepano/flexoki-neovim',
  'ntk148v/komau.vim',
  { 'catppuccin/nvim', name = 'catppuccin' },
  'uloco/bluloco.nvim',
  'LuRsT/austere.vim',
  'ricardoraposo/gruvbox-minor.nvim',
  'NTBBloodbath/sweetie.nvim',

  -- init = function()
  --   -- Load the colorscheme here.
  --   -- Like many other themes, this one has different styles, and you could load
  --   -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
  --   vim.cmd.colorscheme 'tokyonight-night'

  --   -- You can configure highlights by doing something like:
  --   vim.cmd.hi 'Comment gui=none'
  -- end,
}
