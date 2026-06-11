return {
  {
    "taku25/UnrealDev.nvim",
    -- Define all plugins in the development suite.
    -- You can remove any plugins you don't use.
    dependencies = {
      {
        "taku25/UNL.nvim", -- Core Library
        build = "cargo build --release --manifest-path scanner/Cargo.toml",
        lazy = false,
      },
      "taku25/UEP.nvim", -- Project Explorer
      "taku25/UEA.nvim", -- Asset (Blueprint) Inspector
      "taku25/UBT.nvim", -- Build Tool
      "taku25/UCM.nvim", -- Class Manager
      "taku25/ULG.nvim", -- Log Viewer
      "taku25/USH.nvim", -- Unreal Shell
      {
        "taku25/UNX.nvim", -- Logical View
        dependencies = {
          "MunifTanjim/nui.nvim",
          "nvim-tree/nvim-web-devicons",
        },
      },
      "taku25/UDB.nvim", -- Debug
      {
        "taku25/USX.nvim", -- Syntax highlight
        lazy = false,
      },

      -- UI Plugins (Optional)
      "nvim-telescope/telescope.nvim",
      "j-hui/fidget.nvim",
      "nvim-lualine/lualine.nvim",
      {
        "romus204/tree-sitter-manager.nvim",
        opts = {
          ensure_installed = { "cpp", "ushader", "verse" },
          highlight = { "cpp", "ushader", "verse" },
          border = "rounded",
          languages = {
            cpp = {
              install_info = {
                url = "https://github.com/taku25/tree-sitter-cpp",
                use_repo_queries = true,
              },
            },
            ushader = {
              install_info = {
                url = "https://github.com/taku25/tree-sitter-unreal-shader",
                use_repo_queries = true,
              },
            },
            verse = {
              install_info = {
                url = "https://github.com/taku25/tree-sitter-verse",
                use_repo_queries = true,
              },
            },
          },
        },
        config = function(_, opts)
          vim.filetype.add({
            extension = {
              verse = "verse",
              usf = "ushader",
              ush = "ushader",
            },
          })
          require("tree-sitter-manager").setup(opts)
          local group = vim.api.nvim_create_augroup("MyTreesitter", { clear = true })
          vim.api.nvim_create_autocmd("FileType", {
            group = group,
            pattern = opts.highlight,
            callback = function(args)
              vim.treesitter.start(args.buf)
            end,
          })

          -- Open the include file under the cursor (Enhances standard 'gf')
          vim.keymap.set("n", "<leader>gf", require("UEP.api").open_file, { noremap = true, silent = true })

          -- Jump to actual definition, even for Forward Declarations
          vim.keymap.set("n", "gd", require("UEP.api").goto_definition, { noremap = true, silent = true })

          -- Toggle between Header and Source files (<leader>a : Alternate)
          vim.keymap.set("n", "<leader>a", function()
            require("UnrealDev.api").switch_file()
          end, { noremap = true, silent = true })
          vim.keymap.set("n", "<leader>a", function()
            require("UnrealDev.api").switch_file()
          end, { noremap = true, silent = true })

          vim.keymap.set("n", "<D-o>", function()
            require("UnrealDev.api").switch_file()
          end, { noremap = true, silent = true })

          vim.keymap.set({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
          -- <C-s>: Automatically branches between Live Coding (if Editor is running) and UBT Build (if stopped)
          vim.keymap.set("n", "<M-D-s>", function()
            require("UnrealDev.api").is_process_running({
              process_name = "UnrealEditor",
              on_complete = function(is_running)
                if is_running == false then
                  -- Editor is NOT running -> Execute normal Build
                  print("🚀 Starting UBT Build...")
                  require("UnrealDev.api").build({})
                else
                  -- Editor IS running -> Trigger Live Coding
                  print("🔥 Triggering Live Coding...")
                  require("UnrealDev.api").remote_command("livecoding.compile")
                end
              end,
            })
          end, { noremap = true, silent = true })
        end,
      },
      -- ...
    },
    opts = {
      -- Configuration specific to UnrealDev.nvim
      -- (e.g., disable setup for plugins you don't have)
      setup_modules = {
        UBT = true,
        UEP = true,
        ULG = true,
        USH = true,
        UCM = true,
        UEA = true,
        UNX = true,
      },
    },
  },

  -- ---
  -- Individual Plugin Settings (Optional)
  -- ---
  --{ 'taku25/UBT.nvim', opts = { ... } },
  --{ 'taku25/UEP.nvim', opts = { ... } },
  --{ 'taku25/UEA.nvim', opts = { ... } },
  -- ...
}
