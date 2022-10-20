local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

require("telescope").setup({
	defaults = {
		prompt_prefix = " ❯ ",
		initial_mode = "insert",
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
		},
		mappings = {
			i = {
				["<ESC>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<TAB>"] = actions.toggle_selection + actions.move_selection_next,
				["<C-s>"] = actions.send_selected_to_qflist,
				["<C-q>"] = actions.send_to_qflist,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- "smart_case" | "ignore_case" | "respect_case"
		},
	},
})

---------------
-- Functions --
---------------

local Telescope = setmetatable({}, {
	__index = function(_, k)
		if vim.bo.filetype == "NvimTree" then
			vim.cmd.wincmd("l")
		end
		return builtin[k]
	end,
})

local fuzzy_finder = function()
	local ok = pcall(Telescope.git_files, { show_untracked = true })
	if not ok then
		Telescope.find_files()
	end
end

-----------------
-- Keybindings --
-----------------

-- Ctrl-p = fuzzy finder
vim.keymap.set("n", "<C-P>", fuzzy_finder)

-- Get :help at the speed of light
vim.keymap.set("n", "<leader>H", Telescope.help_tags)

-- Fuzzy find active buffers
vim.keymap.set("n", "'b", Telescope.buffers)

-- Search for string
vim.keymap.set("n", "'r", Telescope.live_grep)

-- Fuzzy find changed files in git
vim.keymap.set("n", "'c", Telescope.git_status)

-- Find files
vim.keymap.set("n", "ff", Telescope.find_files)

-- Old files
vim.keymap.set("n", "fo", Telescope.oldfiles)
