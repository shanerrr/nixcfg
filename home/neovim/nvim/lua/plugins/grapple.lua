return {
	{
		"cbochs/grapple.nvim",
		opts = {
			-- Pin set is shared per git repo; falls back to cwd outside a repo.
			scope = "git",
		},
		keys = {
			{ "<leader>ga", function() require("grapple").toggle() end, desc = "Grapple toggle tag" },
			{ "<leader>m", function() require("grapple").toggle_tags() end, desc = "Grapple open menu" },
			{ "<leader>1",  function() require("grapple").select({ index = 1 }) end, desc = "Grapple slot 1" },
			{ "<leader>2",  function() require("grapple").select({ index = 2 }) end, desc = "Grapple slot 2" },
			{ "<leader>3",  function() require("grapple").select({ index = 3 }) end, desc = "Grapple slot 3" },
			{ "<leader>4",  function() require("grapple").select({ index = 4 }) end, desc = "Grapple slot 4" },
		},
	},
}
