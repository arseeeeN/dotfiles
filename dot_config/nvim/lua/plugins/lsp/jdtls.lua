local get_config_name = function()
    local os_uname = vim.loop.os_uname()
    if os_uname.machine == "arm64" then
        if os_uname.sysname == "Linux" then
            return "config_linux_arm"
        elseif os_uname.sysname == "Darwin" then
            return "config_mac_arm"
        end
    else
        if os_uname.sysname == "Linux" then
            return "config_linux"
        elseif os_uname.sysname == "Darwin" then
            return "config_mac"
        elseif os_uname.sysname == "Windows" then
            return "config_win"
        end
    end
    -- Have linux as the fallback
    return "config_linux"
end

return {
    cmd = {
        -- os.getenv("HOME") .. "/.local/share/rtx/installs/java/20/bin/java",
        -- "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        -- "-Dosgi.bundles.defaultStartLevel=4",
        -- "-Declipse.product=org.eclipse.jdt.ls.core.product",
        -- "-Dlog.protocol=true",
        -- "-Dlog.level=ALL",
        -- "-Xmx1g",
        -- "--add-modules=ALL-SYSTEM",
        -- "--add-opens",
        -- "java.base/java.util=ALL-UNNAMED",
        -- "--add-opens",
        -- "java.base/java.lang=ALL-UNNAMED",
        -- "-jar",
        -- table.concat({
        -- 	vim.fn.stdpath("data"),
        -- 	"mason",
        -- 	"packages",
        -- 	"jdtls",
        -- 	"plugins",
        -- 	"org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar",
        -- }, "/"),
        table.concat({
            vim.fn.stdpath("data"),
            "mason",
            "packages",
            "jdtls",
            "bin",
            "jdtls",
        }, "/"),
        "-configuration",
        table.concat({
            vim.fn.stdpath("data"),
            "mason",
            "packages",
            "jdtls",
            get_config_name(),
        }, "/"),
        -- TODO: I don't quite know what the data directory is for and how to set it correctly with my current setup
        -- I saw a config that created a .workspaces folder in the home dir and createa a subdir for each project, I might do that
        -- "-data",
        -- table.concat({
        --  os.getenv('HOME'),
        -- 	".cache",
        -- 	"jdtls",
        -- 	"workspace",
        -- }, "/"),
    },
    -- TODO: on_attach set some LSP specific actions like organizing imports etc. see the github page for details
    root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
    settings = {
        java = {
            format = {
                enabled = false,
            },
            configuration = {
                -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
                -- And search for `interface RuntimeOption`
                -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
                runtimes = {
                    {
                        name = "JavaSE-11",
                        path = os.getenv("HOME") .. "/.local/share/rtx/installs/java/11",
                        -- path = "/usr/lib/jvm/java-11-openjdk/",
                    },
                    {
                        name = "JavaSE-20",
                        path = os.getenv("HOME") .. "/.local/share/rtx/installs/java/20",
                        -- path = "/usr/lib/jvm/java-20-openjdk/",
                    },
                },
            },
        },
    },
}
