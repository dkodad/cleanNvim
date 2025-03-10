vim.g.mapleader = " "

-- Copy to clipboard
vim.keymap.set("v", "<C-c>", [["+y]])

-- Movement
vim.keymap.set("n", "<C-S>", "<Cmd>write<CR>", { desc = "Save buffer" })
