return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			lazygit = {
				configure = true,
				config = {
					os = { editPreset = "nvim-remote" },
					gui = { nerdFontsVersion = "3" },
				},
				theme = {
					[241] = { fg = "Special" },
					activeBorderColor = { fg = "MatchParen", bold = true },
					cherryPickedCommitBgColor = { fg = "Identifier" },
					cherryPickedCommitFgColor = { fg = "Function" },
					defaultFgColor = { fg = "Normal" },
					inactiveBorderColor = { fg = "FloatBorder" },
					optionsTextColor = { fg = "Function" },
					searchingActiveBorderColor = { fg = "MatchParen", bold = true },
					selectedLineBgColor = { bg = "Visual" },
					unstagedChangesColor = { fg = "DiagnosticError" },
				},
				win = { style = "lazygit" },
			},
			bigfile = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			picker = {
				enabled = true,
				layout = "telescope",
				formatters = {
					file = { filename_first = true },
				},
			},
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			dashboard = {
				preset = {
					keys = {
						{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
						{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
						{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
						{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
						{ icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
						{ icon = " ", key = "s", desc = "Restore Session", action = function() require("persistence").load() end },
						{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
					header = [[

               ████ ██████           █████      ██
              ███████████             █████
              █████████ ███████████████████ ███   ███████████
             █████████  ███    █████████████ █████ ██████████████
            █████████ ██████████ █████████ █████ █████ ████ █████
          ███████████ ███    ███ █████████ █████ █████ ████ █████
         ██████  █████████████████████ ████ █████ █████ ████ ██████
         ]],
				},
				sections = {
					{ section = "header" },
					{ section = "keys", indent = 1, padding = 1 },
					{ section = "recent_files", icon = " ", title = "Recent Files", indent = 3, padding = 2 },
					{ section = "startup" },
				},
			},
		},
		keys = {
			{ "<leader>bd", function() Snacks.bufdelete() end, desc = "Buffer delete" },
			{ "<leader>ba", function() Snacks.bufdelete.all() end, desc = "Buffer delete all" },
			{ "<leader>bo", function() Snacks.bufdelete.other() end, desc = "Buffer delete other" },
			{ "<leader>ff", function() Snacks.picker("files") end, desc = "Pick Files" },
			{ "<leader>fb", function() Snacks.picker("buffers") end, desc = "Pick Buffers" },
			{ "<leader>fg", function() Snacks.picker("grep") end, desc = "Live Grep" },
			{ "<C-g>", function() Snacks.lazygit.open() end, desc = "Lazy Git (cwd)" },
		},
	},
}
