return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format", "ruff_organize_imports" },
				rust = { "rustfmt", lsp_format = "fallback" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
		},
		keys = {
			{
				"<S-M-f>",
				function()
					require("conform").format({ lsp_format = "fallback" })
				end,
				desc = "Format",
				mode = { "n", "i" },
			},
		},
	},
}
