-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    -- { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },

    { '<leader>n', ':Neotree show toggle<CR>', { desc = 'NeoTree toggle' } },
    { '<C-A-l>', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          -- ['\\'] = 'close_window',
          ['<leader>n'] = 'close_window',
        },
      },
    },
  },
}