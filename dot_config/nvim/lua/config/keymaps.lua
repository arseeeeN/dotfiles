local mk = require("utils.mapkeys")

-- Buffers
mk.nmap("<leader>s", ":w<CR>", "Save the buffer in the currently focused window")
mk.nmap("<leader>nas", ":noautocmd w<CR>",
    "Save the buffer in the currently focused window without applying any autocommands")
-- TODO: Investigate if :bw or :bd is better. Are global marks, or marks in general any useful? Can't I just use Harpoon?
mk.nmap("<leader>q", ":bw<CR>", "Close the buffer in the currently focused window")
mk.nmap("<Tab>", ":bnext<CR>", "Switch to next buffer")
mk.nmap("<S-Tab>", ":bprev<CR>", "Switch to previous buffer")

-- Windows
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

-- Miscellaneous
mk.nmap("<leader>ts", ":set spell!<CR>", "Toggle spell checking")
mk.nmap("<leader>th", ":set hlsearch!<CR>", "Toggle search highlighting")

-- Zen Mode
mk.nmap("<leader>zm", ":ZenMode<CR>", "Activate Zen Mode")

-- DAP
mk.nmap("<leader>dbt", ":DapToggleBreakpoint<CR>", "Toggle a breakpoint on the current line")
mk.nmap("<leader>dbc", ":DapClearBreakpoints<CR>", "Clear all breakpoints")
mk.nmap("<leader>dc", ":DapContinue<CR>", "Continue the current debugging session or start a new one")
mk.nmap("<leader>dt", ":DapTerminate<CR>", "Terminate the current debugging session")
mk.nmap("<leader>dsi", ":DapStepInto<CR>", "Step into the function")
mk.nmap("<leader>dsu", ":DapStepOut<CR>", "Step out of the function")
mk.nmap("<leader>dso", ":DapStepOver<CR>", "Step over the function")

-- -- rest.nvim
-- mk.nmap("<leader>rr", ":Rest run<CR>", "Run request under the cursor")
-- mk.nmap("<leader>rl", ":Rest last<CR>", "Re-run latest request")

-- Spectre
local spectre = require("spectre")
mk.nmap("<leader>S", spectre.toggle, "Toggle Spectre")
mk.nmap("<leader>Sw", function()
    spectre.open_visual({ select_word = true })
end, "Search current word")
mk.vmap("<leader>Sw", spectre.open_visual, "Search current word")
mk.nmap("<leader>Sp", function()
    spectre.open_file_search({ select_word = true })
end, "Search on current file")

-- Telescope
local builtin = require("telescope.builtin")
local extensions = require("telescope").extensions
mk.nmap("<leader>ff", builtin.find_files, "Find files by name using Telescope")
mk.nmap("<leader>hff", function()
    builtin.find_files({ hidden = true, no_ignore = true, no_ignore_parent = true })
end, "Find files by name including hidden and ignored files using Telescope")
mk.nmap("<leader>fg", extensions.live_grep_args.live_grep_args, "Live ripgrep prompt with Telescope")
mk.nmap("<leader>hfg", function()
    extensions.live_grep_args.live_grep_args({ additional_args = { "--hidden", "--no-ignore", "--no-ignore-parent" } })
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
-- mk.nmap("<leader>re", extensions.rest.select_env, "Select environment for rest.nvim requests using Telescope")
