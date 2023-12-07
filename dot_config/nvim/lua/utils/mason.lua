return {
    mason_packages = table.concat({
        vim.fn.stdpath("data"),
        "mason",
        "packages",
    }, "/")
}
