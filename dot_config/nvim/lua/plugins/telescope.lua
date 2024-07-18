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
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope-live-grep-args.nvim",
                -- This will not install any breaking changes.
                -- For major updates, this must be adjusted manually.
                version = "^1.0.0",
            },
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function(_)
            require("telescope").load_extension("ui-select")
        end,
    },
}
