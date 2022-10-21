local notify = require("notify")
vim.notify = notify

notify.setup({
	background_colour = "#1e222a",
	timeout = 5000,
})

-- Keybindings
vim.keymap.set("", "<Esc>", "<ESC>:noh<CR>:lua require('notify').dismiss()<CR>", { silent = true })
