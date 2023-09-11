return {
	"folke/zen-mode.nvim",
	opts = {
		window = {
			backdrop = 1,
			width = 80,
			options = {
				signcolumn = "no",
				number = false,
				relativenumber = false,
				cursorline = false,
			},
		},
		plugins = {
			alacritty = {
				enabled = true,
				font = "14",
			},
		},
	},
}
