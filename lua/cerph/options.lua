local opt = vim.opt


opt.nu = true
opt.relativenumber = true

opt.guicursor = ""
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true

opt.wrap = false

opt.signcolumn = "yes"
opt.clipboard = "unnamedplus"
opt.hlsearch = false
opt.incsearch = true
opt.termguicolors = true
opt.colorcolumn = "80"
opt.smartindent = true
opt.isfname:append("@-@")
vim.g.have_nerd_font = true
vim.opt.updatetime = 50

