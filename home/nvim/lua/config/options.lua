vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"
vim.opt.backspace = { "start", "eol", "indent" }

vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "

-- sessions managment
vim.opt.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize"

-- global lualine
vim.opt.laststatus = 3
