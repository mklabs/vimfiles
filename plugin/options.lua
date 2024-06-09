local opt = vim.opt

-- When nonempty, shows the effects of |:substitute|,
-- split: Like "nosplit", but also shows partial off-screen results in a preview window.
-- see :help inccomand
opt.inccommand = 'split'

-- Best search settings :)
opt.smartcase = true
opt.ignorecase = true

----- Personal Preferences (well TJ's, but I think I like it too) -----
opt.number = true
-- opt.relativenumber = true

opt.splitbelow = true
opt.splitright = true

opt.signcolumn = "yes"
opt.shada = { "'10", "<0", "s10", "h" }

opt.clipboard = "unnamedplus"

