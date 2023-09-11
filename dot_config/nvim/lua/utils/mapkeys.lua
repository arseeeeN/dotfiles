local create_opts = function(desc, opts)
    opts = opts or {}
    if not opts.desc then
        opts.desc = desc
    end
    return opts
end

return {
    nmap = function(lhs, rhs, desc, opts)
        vim.keymap.set("n", lhs, rhs, create_opts(desc, opts))
    end,
    imap = function(lhs, rhs, desc, opts)
        vim.keymap.set("i", lhs, rhs, create_opts(desc, opts))
    end,
    vmap = function(lhs, rhs, desc, opts)
        vim.keymap.set("v", lhs, rhs, create_opts(desc, opts))
    end,
    xmap = function(lhs, rhs, desc, opts)
        vim.keymap.set("x", lhs, rhs, create_opts(desc, opts))
    end,
    smap = function(lhs, rhs, desc, opts)
        vim.keymap.set("s", lhs, rhs, create_opts(desc, opts))
    end,
}
