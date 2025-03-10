local opt = vim.opt
opt.clipboard = "unnamedplus"
vim.opt.guicursor = ""
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.hlsearch = false
opt.incsearch = true
opt.termguicolors = true
opt.colorcolumn = "80"
opt.wrap = false
opt.smartindent = true
opt.expandtab = true
opt.isfname:append("@-@")
vim.g.have_nerd_font = true
vim.opt.updatetime = 50
