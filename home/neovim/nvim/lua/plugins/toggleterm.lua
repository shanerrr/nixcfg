return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			open_mapping = "<C-j>",
			direction = "horizontal",
			shade_terminals = true,
			start_in_insert = false,
			close_on_exit = true,
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)
			-- Force-kill terminal buffers 
			vim.api.nvim_create_autocmd("ExitPre", {
				callback = function()
					for _, buf in ipairs(vim.api.nvim_list_bufs()) do
						if vim.bo[buf].buftype == "terminal" then
							vim.api.nvim_buf_delete(buf, { force = true })
						end
					end
				end,
			})
		end,
	},
}
