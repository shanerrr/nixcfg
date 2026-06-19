return {
	{
		"nvim-mini/mini.nvim",
		version = "*",
		config = function()
			require("mini.surround").setup()
			require("mini.pairs").setup()
			require("mini.move").setup()
			require("mini.icons").setup()
			MiniIcons.mock_nvim_web_devicons()
			require("mini.statusline").setup()
			require("mini.tabline").setup()
		end,
	},
}
