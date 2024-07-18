return { -- Treesitter interface
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn"t work on Windows
        build = ":TSUpdate",
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                init = function()
                    -- PERF: no need to load the plugin, if we only need its queries for mini.ai
                    local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
                    local opts = require("lazy.core.plugin").values(plugin, "opts", false)
                    local enabled = false
                    if opts.textobjects then
                        for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
                            if opts.textobjects[mod] and opts.textobjects[mod].enable then
                                enabled = true
                                break
                            end
                        end
                    end
                    if not enabled then
                        require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
                    end
                end,
            },
        },
        opts = {
            -- A list of parser names, or "all"
            ensure_installed = {
                "lua",
                "go",
                "python",
                "dockerfile",
                "json",
                "http",
                "yaml",
                "markdown",
                "html",
                "scss",
                "css",
                "vim",
                "rust",
                "javascript",
                "typescript",
                "svelte",
                "java",
                "kdl",
            },
            highlight = {
                enable = true,
                use_languagetree = true,
            },
            indent = {
                enable = true,
            },
            autotag = {
                enable = true,
            },
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
            refactor = {
                highlight_definitions = {
                    enable = true,
                },
                highlight_current_scope = {
                    enable = false,
                },
            },
        },
        -- ---@param opts TSConfig
        -- config = function(_, opts)
        --     require("nvim-treesitter.configs").setup(opts)
        --     local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        --     -- Add custom parsers here
        --     parser_config.nu = {
        --         install_info = {
        --             url = "https://github.com/nushell/tree-sitter-nu",
        --             files = { "src/parser.c" },
        --             branch = "main",
        --         },
        --         filetype = "nu",
        --     }
        -- end,
    },
}
