vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"

vim.opt.clipboard = "unnamedplus"

-- global lualine
vim.opt.laststatus = 3

-- exclude terminal buffers from session save
vim.opt.sessionoptions:remove("terminal")

-- LSP-based folding (nvim 0.11+)
vim.o.foldexpr = "v:lua.vim.lsp.foldexpr()"
vim.o.foldmethod = "expr"
vim.o.foldtext = ""
vim.o.foldlevelstart = 99
