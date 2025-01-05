vim.cmd [[
  aunmenu PopUp
  anoremenu PopUp.Inspect     <cmd>Inspect<CR>
  amenu PopUp.-1-             <NOP>
  anoremenu PopUp.Rename      <cmd>lua vim.lsp.buf.rename()<CR>
  anoremenu PopUp.Definition  <cmd>lua vim.lsp.buf.definition()<CR>
  "anoremenu PopUp.References  <cmd>Telescope lsp_references<CR>
  anoremenu PopUp.References  <cmd>lua require("telescope.builtin").lsp_references(require("telescope.themes").get_ivy())<CR>
  nnoremenu PopUp.Next        <C-o>
  nnoremenu PopUp.Back        <C-t>
  amenu PopUp.-2-             <NOP>
  "amenu     PopUp.URL         gx
]]

local group = vim.api.nvim_create_augroup("nvim_popupmenu", { clear = true })
vim.api.nvim_create_autocmd("MenuPopup", {
  pattern = "*",
  group = group,
  desc = "Custom PopUp Setup",
  callback = function()
    vim.cmd [[
      amenu disable PopUp.Definition
      amenu disable PopUp.References
      "amenu disable PopUp.URL
    ]]

    if vim.lsp.get_clients({ bufnr = 0 })[1] then
      vim.cmd [[
        amenu enable PopUp.Definition
        amenu enable PopUp.References
      ]]
    end

    -- Note: _get_urls in neovim 11+ (requires nighly build as of now)

    -- local _get_urls_get_urlsurls = require("vim.ui")._get_urls()
    -- if vim.startswith(urls[1], "http") then
    --   vim.cmd [[amenu enable PopUp.URL]]
    -- end
  end,
})
-- TODO: Add autocoommand
