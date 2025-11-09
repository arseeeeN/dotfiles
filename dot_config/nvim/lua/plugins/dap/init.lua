return {
    { "mfussenegger/nvim-dap" },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function(_)
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
            dap.configurations.java = {
                {
                    type = "java",
                    name = "Attach to Tomcat",
                    request = "attach",
                    hostName = "localhost",
                    port = "8000",
                },
                {
                    type = "java",
                    name = "Attach to Quarkus",
                    request = "attach",
                    hostName = "localhost",
                    port = "8787",
                },
            }
            dap.adapters.codelldb = require("plugins.dap.codelldb").adapter
        end,
    },
    {
        "leoluz/nvim-dap-go",
        config = true,
    },
}
