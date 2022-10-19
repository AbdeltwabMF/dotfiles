local builtin = require("nnn").builtin

require("nnn").setup({
	explorer = {
		cmd = "nnn",       -- command overrride (-F1 flag is implied, -a flag is invalid!)
		width = 30,        -- width of the vertical split
		side = "topleft",  -- or "botright", location of the explorer window
		session = "",      -- or "global" / "local" / "shared"
		tabs = true,       -- seperate nnn instance per tab
	},
	picker = {
		cmd = "nnn",       -- command override (-p flag is implied)
		style = {
			width = 0.6,     -- percentage relative to terminal size when < 1, absolute otherwise
			height = 0.5,    -- ^
			xoffset = 0.5,   -- ^
			yoffset = 0.5,   -- ^
			border = "rounded" -- border decoration for example "rounded"(:h nvim_open_win)
		},
	}
})

vim.keymap.set('n', '<leader>n', '<CMD>NnnPicker<CR>')
vim.keymap.set('n', '<leader>t', '<CMD>NnnExplorer<CR>')
