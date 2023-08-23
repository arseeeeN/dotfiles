return { -- Telescope
	-- Find, Filter, Preview, Pick. All lua, all the time.
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
			-- TODO: Instead of doing all of this why don't I manipulate the config for the pickers and restart them?
			-- or I call them like I do in the keymaps... maybe that's a bit weird though
			-- local toggle_hidden = function(prompt_bufnr)
			-- 	local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
			-- 	local old_finder = current_picker.finder
			-- 	local cmd = { "rg", "--files", "--color", "never" }
			-- 	if current_picker.hidden == nil or current_picker.hidden == false then
			-- 		table.insert(cmd, "--hidden")
			-- 		table.insert(cmd, "--no-ignore")
			-- 		table.insert(cmd, "--no-ignore-parent")
			-- 		current_picker.hidden = true
			-- 	else
			-- 		current_picker.hidden = false
			-- 	end
			-- 	local new_finder =
			-- 		require("telescope.finders").new_oneshot_job(cmd, { entry_maker = old_finder.entry_maker })
			-- 	current_picker:refresh(new_finder, { multi = current_picker._multi })
			-- end
			require("telescope").setup({
				defaults = {
					wrap_results = true,
					mappings = {
						-- i = {
						-- 	["<C-h>"] = toggle_hidden,
						-- },
					},
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
