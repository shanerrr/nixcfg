return {
	{
		"stevearc/oil.nvim",
		lazy = false,
		opts = {
			default_file_explorer = true,
			view_options = { show_hidden = true },
			keymaps = {
				["<Esc>"] = "actions.close",
			},
			float = {
				padding = 4,
				max_width = 50,
				max_height = 20,
				win_options = { winblend = 0 },
			},
		},
		keys = {
			{ "-", function() require("oil").toggle_float() end, desc = "Toggle oil (float)" },
		},
	},
}
