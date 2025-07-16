require("config.lazy");

vim.opt.shiftwidth = 4;
vim.opt.clipboard = "unnamedplus";
vim.o.shell = "pwsh.exe";
vim.opt.number = true;

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "source current file" });
vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "execute current line" });
vim.keymap.set("v", "<space>x", ":.lua<CR>", { desc = "execute current line" });

-- local x = 5;
-- print(x);

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank();
  end,
});

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

local job_id = 0
vim.keymap.set("n", "<leader>to", function()
  vim.cmd.vnew();
  vim.cmd.term();
  vim.cmd.wincmd("J");
  vim.api.nvim_win_set_height(0, 15);

  job_id = vim.bo.channel;
end);

vim.keymap.set("n", "<leader>ts", function()
  local width = vim.api.nvim_win_get_width(0);

  vim.cmd.vnew();
  vim.cmd.term();
  vim.cmd.wincmd("L");

  -- Open new split with half width of current window
  local split_width = math.floor(width / 2);
  vim.api.nvim_win_set_width(0, split_width);

  job_id = vim.bo.channel;
end);

local current_command = ""
vim.keymap.set("n", "<leader>te", function()
  current_command = vim.fn.input("Command: ");
end);

vim.keymap.set("n", "<leader>tr", function()
  if current_command == "" then
    current_command = vim.fn.input("Command: ");
  end

  vim.fn.chansend(job_id, { current_command .. "\r\n" });
end);
