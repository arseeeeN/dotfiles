return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function(_)
			require("telescope").setup({
				defaults = {
					wrap_results = true,
				},
			})
			require("telescope").load_extension("fzf")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function(_)
			require("telescope").load_extension("file_browser")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function(_)
			require("telescope").load_extension("ui-select")
		end,
	},
}
