return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({})
		end,
	},
	vim.keymap.set("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>"),
	vim.keymap.set("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>"),
}
