local set = vim.keymap.set
local k = vim.keycode

-- ",," to switch to previous edited buffer
set("n", "<leader><leader>", ":b#<CR>")

-- Handy to have when iterating on config or plugins
set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
set("n", "<leader>X", "<cmd>source %<CR>", { desc = "Execute the current file" })

-- Basic movement keybinds, these make navigating splits easy for me
set("n", "<c-j>", "<c-w><c-j>")
set("n", "<c-k>", "<c-w><c-k>")
set("n", "<c-l>", "<c-w><c-l>")
set("n", "<c-h>", "<c-w><c-h>")

-- " Ctrl+arrow keys to switch between window
-- nmap <silent> <C-left>                     :wincmd h<CR>
-- nmap <silent> <C-right>                    :wincmd l<CR>
-- nmap <silent> <C-Down>                     :wincmd j<CR>
-- nmap <silent> <C-Up>                       :wincmd k<CR>

-- Same for arrow keys
set("n", "<c-down>", "<c-w><c-j>")
set("n", "<c-up>", "<c-w><c-k>")
set("n", "<c-right>", "<c-w><c-l>")
set("n", "<c-left>", "<c-w><c-h>")

-- Toggle hlsearch if it's on, otherwise just do "enter"
set("n", "<CR>", function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.v.hlsearch == 1 then
    vim.cmd.nohl()
    return ""
  else
    return k "<CR>"
  end
end, { expr = true })

-- Normally these are not good mappings, but I have left/right on my thumb
-- cluster, so navigating tabs is quite easy this way.
-- set("n", "<left>", "gT")
-- set("n", "<right>", "gt")

-- There are builtin keymaps for this now, but I like that it shows
-- the float when I navigate to the error - so I override them.
-- set("n", "]d", vim.diagnostic.goto_next)
-- set("n", "[d", vim.diagnostic.goto_prev)

-- These mappings control the size of splits (height/width)
-- <M- maps to Alt
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-;>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")

-- Alt+j/k move current line down  or up
local moveLineDown = function()
  if vim.opt.diff:get() then
    vim.cmd [[normal! ]c]]
  else
    vim.cmd [[m .+1<CR>==]]
  end
end

local moveLineUp = function()
  if vim.opt.diff:get() then
    vim.cmd [[normal! [c]]
  else
    vim.cmd [[m .-2<CR>==]]
  end

end

-- Alt+j move current line down
set("n", "<M-j>", moveLineDown)
--
-- Alt+k move current line up
set("n", "<M-k>", moveLineUp)

set("n", "<space>tt", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = 0 }, { bufnr = 0 })
end, { desc = "Enable inlay hint"})
