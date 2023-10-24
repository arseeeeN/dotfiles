return { -- Statusline
    -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
    {
        "nvim-lualine/lualine.nvim",
        config = function(_)
            local lualine = require("lualine")
            local conditions = {
                buffer_not_empty = function()
                    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
                end,
                hide_in_width = function()
                    return vim.fn.winwidth(0) > 80
                end,
                check_git_workspace = function()
                    local filepath = vim.fn.expand("%:p:h")
                    local gitdir = vim.fn.finddir(".git", filepath .. ";")
                    return gitdir and #gitdir > 0 and #gitdir < #filepath
                end
            }

            -- Config
            local config = {
                options = {
                    -- Disable sections and component separators
                    component_separators = "",
                    section_separators = "",
                    disabled_filetypes = { "packer", "NvimTree" },
                    theme = {
                        -- We are going to use lualine_c an lualine_x as left and
                        -- right section. Both are highlighted by c theme .  So we
                        -- are just setting default looks o statusline
                        normal = {
                            c = {}
                        },
                        inactive = {
                            c = {}
                        }
                    }
                },
                sections = {
                    -- these are to remove the defaults
                    lualine_a = {},
                    lualine_b = {},
                    lualine_y = {},
                    lualine_z = {},
                    -- These will be filled later
                    lualine_c = {},
                    lualine_x = {}
                },
                inactive_sections = {
                    -- these are to remove the defaults
                    lualine_a = {},
                    lualine_b = {},
                    lualine_y = {},
                    lualine_z = {},
                    lualine_c = {},
                    lualine_x = {}
                }
            }

            -- Inserts a component in lualine_c at left section
            local function ins_left(component)
                table.insert(config.sections.lualine_c, component)
            end

            -- Inserts a component in lualine_x ot right section
            local function ins_right(component)
                table.insert(config.sections.lualine_x, component)
            end

            ins_left {
                -- mode component
                function()
                    return ""
                end,
            }

            ins_left {
                "filename",
                cond = conditions.buffer_not_empty,
                color = {
                    gui = "bold"
                }
            }

            ins_left {
                "branch",
                icon = "",
                color = {
                    gui = "bold"
                }
            }

            ins_left {
                "diff",
                -- Is it me or the symbol for modified us really weird
                symbols = {
                    added = " ",
                    modified = " ",
                    removed = " "
                },
                cond = conditions.hide_in_width
            }

            -- Insert mid section. You can make any number of sections in neovim :)
            -- for lualine it"s any number greater then 2
            ins_left { function()
                return "%="
            end }

            ins_right {
                -- Lsp server name .
                function()
                    local msg = "null"
                    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                    local clients = vim.lsp.get_active_clients()
                    if next(clients) == nil then
                        return msg
                    end
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                            return client.name
                        end
                    end
                    return msg
                end,
                icon = " LSP:",
                color = {
                    gui = "bold"
                }
            }

            ins_right {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                symbols = {
                    error = " ",
                    warn = " ",
                    info = " "
                },
                always_visible = true
            }

            ins_right {
                "o:encoding", -- option component same as &encoding in viml
                fmt = string.upper,
                cond = conditions.hide_in_width,
                color = {
                    gui = "bold"
                }
            }

            ins_right {
                "fileformat",
                fmt = string.upper,
                icons_enabled = false,
                color = {
                    gui = "bold"
                }
            }

            ins_right {
                "location",
                color = {
                    gui = "bold"
                }
            }

            ins_right {
                "progress",
                color = {
                    gui = "bold"
                }
            }

            -- Now don"t forget to initialize lualine
            lualine.setup(config)
        end
    } }
