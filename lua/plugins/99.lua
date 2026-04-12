return {
  "ThePrimeagen/99",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local _99 = require("99")
    _99.setup({
      -- OpenCode is default; you can switch to ClaudeCodeProvider, etc.
      provider = _99.Providers.OpenCodeProvider,
      model = "lmstudio-macstudio/qwen/qwen3.5-35b-a3b",

      -- Project-specific AI instructions
      md_files = { "AGENTS.md" },

      -- Optional: configure where to look for global "skills"
      custom_rules = { "~/", "~/.agents/skills", "~/.config/opencode/skills" },
    })

    -- Keymaps
    --
    vim.keymap.set("v", "<leader>9v", function()
      _99.visual()
    end, { desc = "99 Visual" })
    vim.keymap.set("n", "<leader>9s", function()
      _99.search()
    end, { desc = "99 Search" })
    vim.keymap.set("n", "<leader>9x", function()
      _99.stop_all_requests()
    end, { desc = "99 Stop" })
    vim.keymap.set("n", "<leader>9m", function()
      require("99.extensions.telescope").select_model()
    end, { desc = "99 switch models" })
  end,
}
