require("copilot").setup({
	panel = {
		enabled = false,
		auto_refresh = false,
	},
	suggestion = {
		enabled = true,
		auto_trigger = true,
		debounce = 75,
		keymap = {
			accept = "<M-l>",
			next = "<M-]>",
			prev = "<M-[>",
			dismiss = "<M-o>",
		},
	},
	filetypes = {},
	copilot_node_command = vim.fn.expand("$HOME") .. "/.config/nvm/versions/node/v16.18.1/bin/node",
	server_opts_overrides = {},
})
