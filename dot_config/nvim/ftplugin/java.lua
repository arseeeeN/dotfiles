require("jdtls").start_or_attach({
    cmd = { "/sbin/jdtls" },
    root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
})
