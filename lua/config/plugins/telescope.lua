-- plugins/telescope.lua:
--
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "andrewberty/telescope-themes",

    -- Additional `cmake --install build --prefix build` command needed on windows (https://github.com/nvim-telescope/telescope-fzf-native.nvim/issues/118#issuecomment-1844818915)
    { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" },
  },

  config = function()
    local telescope = require("telescope");
    local builtin = require("telescope.builtin");
    local themes = require("telescope.themes");

    telescope.setup {
      pickers = {
      },

      extensions = {
        fzf = {}
      }
    }

    telescope.load_extension "fzf"

    local ivy = function(fn, opts)
      return function() fn(themes.get_ivy(opts)) end
    end

    -- vim.keymap.set("n", "<leader>fh", builtin.help_tags);
    vim.keymap.set("n", "<leader>fh", ivy(builtin.help_tags), { desc = "telescope find help_tags" });
    vim.keymap.set("n", "<leader>ff", ivy(builtin.find_files), { desc = "telescope find files" });
    vim.keymap.set("n", "<leader>fd", ivy(builtin.find_files), { desc = "telescope find files" });
    vim.keymap.set("n", "<leader>fb", ivy(builtin.buffers), { desc = "telescope find buffers" });

    local cwds = {
      config = vim.fn.stdpath("config"),
      lazy = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
    };

    vim.keymap.set("n", "<leader>fc", ivy(builtin.find_files, { cwd = cwds.config }),
      { desc = "telescope find config" });

    vim.keymap.set("n", "<leader>fp", ivy(builtin.find_files, { cwd = cwds.lazy }),
      { desc = "telescope find packages" });

    require("config.telescope.multigrep").setup();
  end
}
