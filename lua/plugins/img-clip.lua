local md_options = {
  url_encode_path = true, ---@type boolean | fun(): boolean

  -- template = "![$CURSOR]($FILE_PATH)", ---@type string | fun(context: table): string

  -- Credits to linkarzu: https://github.com/linkarzu/dotfiles-latest/blob/main/neovim/neobean/lua/plugins/img-clip.lua#L135
  --
  -- -- The template is what specifies how the alternative text and path
  -- -- of the image will appear in your file
  --
  -- -- $CURSOR will paste the image and place your cursor in that part so
  -- -- you can type the "alternative text", keep in mind that this will
  -- -- not affect the name that the image physically has
  -- template = "![$CURSOR]($FILE_PATH)", ---@type string
  --
  -- -- This will just statically type "Image" in the alternative text
  -- template = "![Image]($FILE_PATH)", ---@type string
  --
  -- -- This will dynamically configure the alternative text to show the
  -- -- same that you configured as the "file_name" above
  template = "![$FILE_NAME]($FILE_PATH)", ---@type string
}
return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    default = {
      -- file and directory options
      -- dir_path = "assets", ---@type string | fun(): string
      dir_path = function()
        return vim.fn.expand("%:t:r")
      end,
      -- relative_to_current_file = false, ---@type boolean | fun(): boolean
      relative_to_current_file = true,
    },

    -- filetype specific options
    filetypes = {
      markdown = md_options,
      mdx = md_options,
      ["markdown.mdx"] = md_options,
    },
  },
  keys = {
    -- suggested keymap
    { "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
