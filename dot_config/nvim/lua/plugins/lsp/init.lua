-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        lazy = true,
        dependencies = {
            -- Neodev for better types and completions in Neovim plugins and configs
            { "folke/neodev.nvim" },
            -- Mason
            -- Portable package manager for Neovim that runs everywhere Neovim runs.
            -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
            { "mason-org/mason.nvim" },
            { "mason-org/mason-lspconfig.nvim" }, -- Autocomplete
            -- A completion plugin for neovim coded in Lua.
            {
                "hrsh7th/nvim-cmp",
                dependencies = {
                    "hrsh7th/cmp-nvim-lsp",
                    "hrsh7th/cmp-path",
                    "hrsh7th/cmp-buffer",
                },
            },
        },
        opts = {
            -- Automatically format on save
            autoformat = true,
            -- options for vim.lsp.buf.format
            -- `bufnr` and `filter` is handled by the LazyVim formatter,
            -- but can be also overridden when specified
            format = {
                formatting_options = nil,
                timeout_ms = nil,
            },
            -- LSP Server Settings
            ---@type lspconfig.options
            servers = {
                jsonls = {},
                dockerls = {},
                bashls = {},
                gopls = {},
                jdtls = require("plugins.lsp.jdtls"),
                lua_ls = require("plugins.lsp.lua_ls"),
                svelte = {},
                tailwindcss = {},
                rust_analyzer = {},
                kotlin_language_server = {},
            },
            -- you can do any additional lsp server setup here
            -- return true if you don"t want this server to be setup with lspconfig
            ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
            setup = {
                lua_ls = function(_, opts)
                    local library = opts.settings.Lua.workspace.library
                    table.insert(library, require("neodev.config").types())
                    return false
                end,
                jdtls = function(_, opts)
                    vim.api.nvim_create_autocmd("Filetype", {
                        pattern = { "java" },
                        callback = function()
                            require("jdtls").start_or_attach(opts)
                        end,
                    })
                    return true
                end,
                kotlin_language_server = function(_, opts)
                    opts.root_dir = require("lspconfig").util.root_pattern(".git")
                    return false
                end,
                rust_analyzer = function()
                    return true
                end
                -- groovyls = function(_, opts)
                --     opts.cmd = { table.concat({
                --         require("utils.mason").mason_packages,
                --         "groovyls",
                --         "bin",
                --         "groovyls",
                --     }, "/") }
                --     return false
                -- end,
                -- Specify * to use this function as a fallback for any server
                -- ["*"] = function(server, opts) end,
            },
        },
        ---@param opts Opts
        config = function(_, opts)
            local servers = opts.servers
            local capabilities =
                require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

            local function setup(server)
                local server_opts = vim.tbl_deep_extend("force", {
                    capabilities = vim.deepcopy(capabilities),
                }, servers[server] or {})

                vim.lsp.config[server] = server_opts
                if opts.setup[server] then
                    if opts.setup[server](server, server_opts) then
                        return
                    end
                elseif opts.setup["*"] then
                    if opts.setup["*"](server, server_opts) then
                        return
                    end
                end
                vim.lsp.enable(server)
            end

            require("mason").setup()
            local mlsp = require("mason-lspconfig")
            local available = mlsp.get_available_servers()

            local ensure_installed = {} ---@type string[]
            for server, server_opts in pairs(servers) do
                if server_opts then
                    server_opts = server_opts == true and {} or server_opts
                    -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
                    if server_opts.mason == false or not vim.tbl_contains(available, server) then
                        setup(server)
                    else
                        ensure_installed[#ensure_installed + 1] = server
                    end
                end
            end
            require("mason-lspconfig").setup({
                ensure_installed = ensure_installed,
                automatic_installation = true,
            })

            -- nvim-cmp setup
            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = {
                    {
                        name = "nvim_lsp",
                    },
                    {
                        name = "path",
                    },
                    {
                        name = "buffer",
                        option = {
                            -- Avoid accidentally running on big files
                            get_bufnrs = function()
                                local buf = vim.api.nvim_get_current_buf()
                                local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
                                if byte_size > 1024 * 1024 then -- 1 Megabyte max
                                    return {}
                                end
                                return { buf }
                            end,
                        },
                    },
                },
            })
        end,
    },
    -- Use Neovim as a language server to inject LSP diagnostics,
    -- code actions, and more via Lua.
    -- {
    --     "nvimtools/none-ls.nvim",
    --     dependencies = { "mason-org/mason.nvim", "nvim-lua/plenary.nvim" },
    --     lazy = false,
    --     config = function()
    --         local null_ls = require("null-ls")
    --         local formatting = null_ls.builtins.formatting
    --         local diagnostics = null_ls.builtins.diagnostics

    --         null_ls.setup({
    --             debug = false,
    --             sources = {
    --                 formatting.prettier.with({
    --                     disabled_filetypes = { "yaml" },
    --                     extra_filetypes = { "toml" },
    --                     extra_args = {
    --                         "--tab-width",
    --                         "4",
    --                         "--indent_size",
    --                         "4",
    --                     },
    --                 }),
    --                 formatting.black.with({
    --                     extra_args = { "--fast" },
    --                 }),
    --                 formatting.stylua,
    --                 formatting.google_java_format,
    --                 diagnostics.flake8,
    --             },
    --         })
    --     end,
    -- },
    -- {
    --     "pmizio/typescript-tools.nvim",
    --     dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    --     opts = {},
    -- },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = {
            -- Define your formatters
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                javascript = { "prettierd", "prettier", stop_after_first = true },
                javascriptreact = { "prettierd", "prettier", stop_after_first = true },
                typescript = { "prettierd", "prettier", stop_after_first = true },
                typescriptreact = { "prettierd", "prettier", stop_after_first = true },
            },
            -- Set default options
            default_format_opts = {
                lsp_format = "fallback",
            },
            -- Set up format-on-save
            format_on_save = { timeout_ms = 500 },
        },
        init = function()
            -- If you want the formatexpr, here is the place to set it
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end,
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^6",
        lazy = false,
        init = function()
            vim.g.rustaceanvim = {
                server = {
                    cmd = function()
                        local mason_registry = require("mason-registry")
                        if mason_registry.is_installed('rust-analyzer') then
                            -- This may need to be tweaked depending on the operating system.
                            local ra = mason_registry.get_package('rust-analyzer')
                            local ra_filename = ra:get_receipt():get().links.bin['rust-analyzer']
                            return { ('%s/%s/%s'):format('rust_analyze', require("utils.mason").mason_packages,
                                ra_filename or 'rust-analyzer') }
                        else
                            -- global installation
                            return { 'rust-analyzer' }
                        end
                        -- local ra_binary = mason_registry.is_installed("rust-analyzer")
                        --     -- This may need to be tweaked, depending on the operating system.
                        --     and mason_registry.get_package("rust-analyzer"):get_install_path() ..
                        --     "/rust-analyzer-aarch64-apple-darwin"
                        --     or "rust-analyzer"
                        -- return { ra_binary } -- You can add args to the list, such as "--log-file"
                    end,
                },
                tools = {},
                dap = {
                    adapter = require("plugins.dap.codelldb").adapter
                },
            }
        end
    },
    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        config = function()
            require("crates").setup()
        end,
    },
    { "mfussenegger/nvim-jdtls" },
    { "folke/neodev.nvim" },
}
