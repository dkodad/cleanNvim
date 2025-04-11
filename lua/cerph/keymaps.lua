vim.g.mapleader = " "

-- Copy to clipboard
vim.keymap.set("v", "<C-c>", [["+y]])

vim.keymap.set("n", "<C-S>", "<Cmd>write<CR>", { desc = "Save buffer" })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("v",'<leader>y', ':w !win32yank.exe -i<CR>', { noremap = true, silent = true }, { desc = "Copy to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>bd", "<CMD>:bd<CR>")

vim.keymap.set('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
vim.keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
vim.keymap.set('v', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
vim.keymap.set('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
vim.keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>')
