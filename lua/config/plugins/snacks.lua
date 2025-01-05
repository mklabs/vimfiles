---@diagnostic disable: undefined-global, undefined-doc-name
return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
      { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
      { "<leader>gg", function() Snacks.lazygit() end,          desc = "Lazygit" },
      { "<leader>gl", function() Snacks.lazygit.log() end,      desc = "Lazygit Log (cwd)" },
    },


    ---@type snacks.Config
    opts = {
      lazygit = {
        -- your lazygit configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        enabled = true
      },

      dashboard = {

        config = function()
          -- vim.keymap.set("n", "<leader>h", function() Snacks.dashboard() end, { desc = "Snacks.dashboard" });
        end,

        width = 80,

        example = "compact_files",

        -- sections = {
        --
        --   { section = "header" },
        --   -- { section = "terminal", cmd = "splashcii", hl = "header", height = 16, padding = 1 },
        --   { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        --   { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        --   { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        --   { section = "startup" },
        --   -- { pane = 2, section = "terminal", cmd = "gh skyline -a -y 2024-2025", padding = 1 },
        --   -- { pane = 2, section = "terminal", cmd = "gh skyline -a", padding = 1 },
        --   { pane = 2, icon = " ", desc = "Browse Repo", padding = 1, key = "b", action = function() Snacks.gitbrowse() end, },
        --   function()
        --     local in_git = Snacks.git.get_root() ~= nil
        --     local cmds = {
        --       {
        --         title = "Notifications",
        --         cmd = "gh notify -s -a -n5",
        --         action = function()
        --           vim.ui.open("https://github.com/notifications")
        --         end,
        --         key = "n",
        --         icon = " ",
        --         height = 5,
        --         enabled = true,
        --       },
        --       {
        --         title = "Open Issues",
        --         cmd = "gh issue list -L 3",
        --         key = "i",
        --         action = function()
        --           vim.fn.jobstart("gh issue list --web", { detach = true })
        --         end,
        --         icon = " ",
        --         height = 7,
        --       },
        --       {
        --         icon = " ",
        --         title = "Open PRs",
        --         cmd = "gh pr list -L 3",
        --         key = "p",
        --         action = function()
        --           vim.fn.jobstart("gh pr list --web", { detach = true })
        --         end,
        --         height = 7,
        --       },
        --       {
        --         icon = " ",
        --         title = "Git Status",
        --         cmd = "git --no-pager diff --stat -B -M -C",
        --         height = 10,
        --       },
        --     }
        --     return vim.tbl_map(function(cmd)
        --       return vim.tbl_extend("force", {
        --         pane = 2,
        --         section = "terminal",
        --         enabled = in_git,
        --         padding = 1,
        --         ttl = 5 * 60,
        --         indent = 3,
        --       }, cmd)
        --     end, cmds)
        --   end,
        -- },

      },
    }
  }
};
