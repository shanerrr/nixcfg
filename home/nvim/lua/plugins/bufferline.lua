return {
	{
		"akinsho/bufferline.nvim",
		event = { "BufNewFile", "BufReadPost" },
		opts = {
			options = {
				offsets = {
					{
						filetype = "snacks_layout_box",
						text = "",
						separator = true,
					},
				},
			},
		},
		keys = {
			{ "<Leader>,", "<Cmd>BufferLineCyclePrev<Cr>", desc = "Previous buffer" },
			{ "<Leader>.", "<Cmd>BufferLineCycleNext<Cr>", desc = "Next buffer" },
			{ "<Leader><", "<Cmd>BufferLineMovePrev<Cr>", desc = "Move buffertab left" },
			{ "<Leader>>", "<Cmd>BufferLineMoveNext<Cr>", desc = "Move buffertab right" },
			{ "<Leader>m", "<Cmd>BufferLinePick<Cr>", desc = "Show buffertab targets" },
		},
	},
}
