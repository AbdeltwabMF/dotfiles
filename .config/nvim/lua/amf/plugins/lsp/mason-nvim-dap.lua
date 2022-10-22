require("mason-nvim-dap").setup({
	ensure_installed = {
		"python",
		"delve",
		"cppdbg",
		"node2",
		"javadbg",
		"bash",
		"js",
	},
})
