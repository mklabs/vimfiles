return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "make",
        "ruby",
        "powershell",
        "editorconfig",
        "gitignore",
        "svg",

        -- "bash",
        -- "c",
        -- "cpp",
        -- "css",
        -- "dockerfile",
        -- "embedded_template",
        -- "go",
        -- "graphql",
        -- "html",
        -- "ini",
        -- "javascript",
        -- "json",
        -- "lua",
        -- "markdown",
        -- "markdown_inline",
        -- "query",
        -- "rust",
        -- "typescript",
        -- "vim",
        -- "vimdoc",
        -- "yaml",
        -- "zig",
      },
    },
  },
}
