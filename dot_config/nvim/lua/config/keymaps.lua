local mk = require("utils.mapkeys")
-- Fast saving with <leader> and s
mk.nmap("<leader>s", ":w<CR>", "Save the buffer in the currently focused window")
-- Switch between windows
mk.nmap("<leader>wh", "<C-w>h", "Move focus to the window on the left")
mk.nmap("<leader>wj", "<C-w>j", "Move focus to the window below")
mk.nmap("<leader>wk", "<C-w>k", "Move focus to the window above")
mk.nmap("<leader>wl", "<C-w>l", "Move focus to the window on the right")
mk.nmap("<leader>wq", "<C-w>q", "Close the currently focused window")

-- Diagnostics
mk.nmap("<leader>de", vim.diagnostic.open_float, "Open diagnostic in a floating window")
mk.nmap("[d", vim.diagnostic.goto_prev, "Go to the previous diagnostic")
mk.nmap("]d", vim.diagnostic.goto_next, "Go to the next diagnostic")
mk.nmap("<leader>dl", vim.diagnostic.setloclist, "Add diagnostic to location list")

-- Move between buffers
mk.nmap("<Tab>", ":bnext<CR>", "Switch to next buffer")
mk.nmap("<S-Tab>", ":bprev<CR>", "Switch to previous buffer")

-- Miscellaneous
mk.nmap("<leader>cs", ":set spell!<CR>", "Toggle spell checking")

-- Zen Mode
mk.nmap("<leader>zm", ":ZenMode<CR>", "Activate Zen Mode")

-- Telescope
local builtin = require("telescope.builtin")
local extensions = require("telescope").extensions
mk.nmap("<leader>ff", builtin.find_files, "Find files by name using Telescope")
mk.nmap("<leader>hff", function()
	builtin.find_files({ hidden = true, no_ignore = true, no_ignore_parent = true })
end, "Find files by name including hidden and ignored files using Telescope")
mk.nmap("<leader>fg", builtin.live_grep, "Live ripgrep prompt with Telescope")
mk.nmap("<leader>hfg", function()
	builtin.live_grep({ additional_args = { "--hidden", "--no-ignore", "--no-ignore-parent" } })
end, "Live ripgrep prompt including hidden and ignored files using Telescope")
mk.nmap("<leader>fb", builtin.buffers, "Find buffers by file name using Telescope")
mk.nmap("<leader>fab", extensions.scope.buffers, "Find buffers by file name across all tabs using Telescope")
mk.nmap("<leader>fh", builtin.help_tags, "Find help tags using Telescope")
mk.nmap("<leader>fk", builtin.keymaps, "Find keymaps using telescope")

mk.nmap("<leader>fe", extensions.file_browser.file_browser, "Open file explorer at pwd using Telescope")
mk.nmap("<leader>hfe", function()
	extensions.file_browser.file_browser({ hidden = true, respect_gitignore = false })
end, "Open file explorer at pwd including hidden and ignored files using Telescope")
mk.nmap("<leader>bfe", function()
	extensions.file_browser.file_browser({ path = "%:p:h", select_buffer = "true" })
end, "Open file explorer at buffer file location using Telescope")
mk.nmap("<leader>hbfe", function()
	extensions.file_browser.file_browser({
		hidden = true,
		respect_gitignore = false,
		path = "%:p:h",
		select_buffer = "true",
	})
end, "Open file explorer at buffer file location including hidden and ignored files using Telescope")
