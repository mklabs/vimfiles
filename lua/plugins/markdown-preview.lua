return {
  -- disable lazyvim default markdown-preview
  {
    "iamcco/markdown-preview.nvim",
    enabled = false,
  },

  -- try this new one
  {
    "selimacerbas/markdown-preview.nvim",
    dependencies = { "selimacerbas/live-server.nvim" },
    enabled = true,
    name = "selimacerbas-markdown-preview.nvim",
    config = function()
      require("markdown_preview").setup({
        -- all optional; sane defaults shown
        port = 8421,
        open_browser = true,
        debounce_ms = 300,
      })
    end,
  },
}
