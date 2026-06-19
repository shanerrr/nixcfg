return {
	"nvim-mini/mini.base16",
	lazy = false,
	priority = 1000,
	config = function()
		require("mini.base16").setup({
			use_cterm = true,
			palette = {
				base00 = "#0a0c18", -- default bg (night sky)
				base01 = "#15172a", -- lighter bg (statusline, folds)
				base02 = "#424153", -- selection bg (the slate)
				base03 = "#4a4d64", -- comments, line numbers
				base04 = "#8a8fae", -- dark fg (statusline fg)
				base05 = "#c6cae0", -- default fg
				base06 = "#eef0fa", -- light fg
				base07 = "#ffffff", -- lightest
				base08 = "#c95f6b", -- red    -> variables, diff delete
				base09 = "#d8b46c", -- amber  -> numbers, constants
				base0A = "#ecca8a", -- yellow -> types, search
				base0B = "#74b09a", -- green  -> strings
				base0C = "#2bb0d6", -- cyan   -> escapes, support
				base0D = "#3b82d9", -- blue   -> functions
				base0E = "#8c7bd6", -- magenta-> keywords
				base0F = "#b56b7a", -- rose   -> deprecated/special
			},
		})
	end,
}
