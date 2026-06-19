return {
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {
			pre_save = function()
				for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					if vim.api.nvim_buf_is_valid(buf) and not vim.bo[buf].modified then
						local name = vim.api.nvim_buf_get_name(buf)
						local buftype = vim.bo[buf].buftype
						if name == "" or buftype ~= "" then
							pcall(vim.api.nvim_buf_delete, buf, {})
						end
					end
				end
			end,
		},
	},
}
