return {
	{
		"bjarneo/ethereal.nvim",
		lazy = false,
		opts = { style = "night" },
		config = function()
			vim.cmd.colorscheme("ethereal")
		end,
	},
}
