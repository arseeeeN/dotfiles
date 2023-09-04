return {
	settings = {
		Lua = {
			workspace = {
				checkThirdParty = false,
				library = {
					vim.fn.expand("$VIMRUNTIME"),
					"${3rd}/busted/library",
					"${3rd}/luassert/library",
				},
				maxPreload = 5000,
				preloadFileSize = 10000,
			},
		},
	},
}
