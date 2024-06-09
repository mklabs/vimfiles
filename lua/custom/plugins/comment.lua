return {
  -- "gc" to comment visual regions/lines
  -- https://github.com/numToStr/Comment.nvim
  {
    'numToStr/Comment.nvim',

    opts = {
      toggler = {
        ---Line-comment toggle keymap
        -- line = 'gcc',
        line = 'gcc',
        ---Block-comment toggle keymap
        block = 'gbc',
      },
    },

    config = function()
      require('Comment').setup({
        -- Ensure on line comment toggle to move the cursor down one line
        post_hook = function(ctx)
          if ctx.range.srow == ctx.range.erow then
            -- do something with the current line
            vim.api.nvim_command 'norm! j'
          else
            -- do something with lines range
          end
        end
      })
      -- Alt+! to toggle single line comment
      vim.api.nvim_set_keymap('n', '<A-!>', 'gcc', { desc = 'Comment toggle current line'})
      vim.api.nvim_set_keymap('v', '<A-!>', 'gc', { desc = 'Comment toggle current line'})
    end,
  },

  -- Highlight todo, notes, etc in comments
  -- https://github.com/folke/todo-comments.nvim
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
