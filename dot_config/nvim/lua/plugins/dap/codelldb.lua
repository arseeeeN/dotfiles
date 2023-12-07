local mason_packages = require("utils.mason").mason_packages
local extension_path = table.concat({
    mason_packages,
    "codelldb",
    "extension",
}, "/")
local codelldb_path = extension_path .. '/adapter/codelldb'
local liblldb_path = extension_path .. '/lldb/lib/liblldb'
local this_os = vim.loop.os_uname().sysname;

-- The path in windows is different
if this_os == "Windows" then
    codelldb_path = codelldb_path .. ".exe"
    liblldb_path = liblldb_path .. ".dll"
else
    -- The liblldb extension is .so for linux and .dylib for macOS
    liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
end

return {
    setup_adapters = function(dap)
        dap.adapters.rt_lldb = require('rust-tools.dap')
            .get_codelldb_adapter(codelldb_path, liblldb_path)
        -- TODO: Maybe add my own rust adapter + config here? The above doesn't work too well.
    end,
}
