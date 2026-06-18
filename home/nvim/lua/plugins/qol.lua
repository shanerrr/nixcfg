return {
	{
		"nvim-mini/mini.nvim",
		version = "*",
		config = function()
			require("mini.surround").setup()
			require("mini.pairs").setup()
			require("mini.move").setup()
			require("mini.comment").setup({
				mappings = {
					comment = "<C-/>",
					comment_line = "<C-/>",
					comment_visual = "<C-/>",
					textobject = "<C-/>",
				},
			})
		end,
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = {},
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		---@type snacks.Config
		opts = {
			lazygit = {
				configure = true,
				config = {
					os = { editPreset = "nvim-remote" },
					gui = {
						nerdFontsVersion = "3",
					},
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
					selectedLineBgColor = { bg = "Visual" }, -- set to `default` to have no background colour
					unstagedChangesColor = { fg = "DiagnosticError" },
				},
				win = {
					style = "lazygit",
				},
			},
			explorer = {
				enabled = true,
				replace_netrw = true,
				follow_file = true,
			},
			bigfile = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			picker = {
				enabled = true,
				layout = "telescope",
				sources = {
					explorer = {
						auto_close = false,
						follow_file = true,
						follow = true,
						hidden = true,
					},
				},
				formatters = {
					file = {
						filename_first = true,
					},
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
					pick = nil,
					---@type snacks.dashboard.Item[]
					keys = {
						{
							icon = " ",
							key = "f",
							desc = "Find File",
							action = ":lua Snacks.dashboard.pick('files')",
						},
						{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
						{
							icon = " ",
							key = "g",
							desc = "Find Text",
							action = ":lua Snacks.dashboard.pick('live_grep')",
						},
						{
							icon = " ",
							key = "r",
							desc = "Recent Files",
							action = ":lua Snacks.dashboard.pick('oldfiles')",
						},
						{
							icon = " ",
							key = "c",
							desc = "Config",
							action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
						},
						{
							icon = " ",
							key = "s",
							desc = "Restore Session",
							action = function()
								require("persistence").load()
							end,
						},
						{
							icon = "󰒲 ",
							key = "l",
							desc = "Lazy",
							action = ":Lazy",
							enabled = package.loaded.lazy ~= nil,
						},
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
					header = [[
                                                                             
               ████ ██████           █████      ██                     
              ███████████             █████                             
              █████████ ███████████████████ ███   ███████████   
             █████████  ███    █████████████ █████ ██████████████   
            █████████ ██████████ █████████ █████ █████ ████ █████   
          ███████████ ███    ███ █████████ █████ █████ ████ █████  
         ██████  █████████████████████ ████ █████ █████ ████ ██████ 
         ]],
				},
				sections = {
					{ section = "header" },
					{
						section = "keys",
						indent = 1,
						padding = 1,
					},
					{ section = "recent_files", icon = " ", title = "Recent Files", indent = 3, padding = 2 },
					{ section = "startup" },
				},
			},
		},
		keys = {
			{
				"<C-b>",
				function()
					Snacks.explorer.open()
				end,
				desc = "Open explorer",
				mode = "n",
			},
			{
				"<leader>bd",
				function()
					Snacks.bufdelete()
				end,
				desc = "Buffer delete",
				mode = "n",
			},
			{
				"<leader>ba",
				function()
					Snacks.bufdelete.all()
				end,
				desc = "Buffer delete all",
				mode = "n",
			},
			{
				"<leader>bo",
				function()
					Snacks.bufdelete.other()
				end,
				desc = "Buffer delete other",
				mode = "n",
			},
			{
				"<leader>ff",
				function()
					Snacks.picker("files")
				end,
				desc = "Pick Files",
				mode = "n",
			},
			{
				"<leader>fb",
				function()
					Snacks.picker("buffers")
				end,
				desc = "Pick Buffers",
				mode = "n",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker("grep")
				end,
				desc = "Live Grep",
				mode = "n",
			},
			{
				"<C-g>",
				function()
					Snacks.lazygit.open()
				end,
				desc = "Lazy Git (cwd)",
				mode = "n",
			},
		},
	},
}
