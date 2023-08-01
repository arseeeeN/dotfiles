-- Fast saving with <leader> and s
vim.keymap.set("n", "<leader>s", ":w<CR>", {})
-- Move around splits
vim.keymap.set("n", "<leader>wh", "<C-w>h", {})
vim.keymap.set("n", "<leader>wj", "<C-w>j", {})
vim.keymap.set("n", "<leader>wk", "<C-w>k", {})
vim.keymap.set("n", "<leader>wl", "<C-w>l", {})

-- Diagnostics
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Move between buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>")

-- Reload configuration without restart nvim
vim.keymap.set("n", "<leader>r", ":so %<CR>", {})

-- Telescope
-- <leader> is a space now
local builtin = require("telescope.builtin")
local extensions = require("telescope").extensions
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>ffh", function()
	builtin.find_files({ hidden = true, no_ignore = true, no_ignore_parent = true })
end, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fgh", function()
	builtin.live_grep({ additional_args = { "--hidden", "--no-ignore", "--no-ignore-parent" } })
end, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

vim.keymap.set("n", "<leader>fe", extensions.file_browser.file_browser, {})
vim.keymap.set("n", "<leader>feh", function()
	extensions.file_browser.file_browser({ hidden = true, respect_gitignore = false })
end, {})
vim.keymap.set("n", "<leader>feb", function()
	extensions.file_browser.file_browser({ path = "%:p:h", select_buffer = "true" })
end, {})
vim.keymap.set("n", "<leader>febh", function()
	extensions.file_browser.file_browser({
		hidden = true,
		respect_gitignore = false,
		path = "%:p:h",
		select_buffer = "true",
	})
end, {})
