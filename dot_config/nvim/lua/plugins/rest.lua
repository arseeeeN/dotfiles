return {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function(_)
        local rest = require("rest-nvim")
        rest.setup()
        vim.keymap.set("n", "R", rest.run, {})
    end,
}
