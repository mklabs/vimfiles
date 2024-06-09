return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },

  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<C-e>', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open harpoon window' })

    -- vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Add to harpoon list' })
    -- vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    -- vim.keymap.set('n', '<C-h>', function() harpoon:list():select(1) end)
    -- vim.keymap.set('n', '<C-t>', function() harpoon:list():select(2) end)
    -- vim.keymap.set('n', '<C-n>', function() harpoon:list():select(3) end)
    -- vim.keymap.set('n', '<C-s>', function() harpoon:list():select(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<C-S-P>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<C-S-N>', function()
      harpoon:list():next()
    end)

    -- Set <space>1..<space>5 be my shortcuts to moving to the files
    for _, idx in ipairs { 1, 2, 3, 4, 5 } do
      vim.keymap.set('n', string.format('<space>%d', idx), function()
        harpoon:list():select(idx)
      end, { desc = string.format('Hapoon select %d', idx) })
    end
  end,
}

