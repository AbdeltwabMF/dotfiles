local leap = require("leap")

leap.add_default_mappings()

-- Disable auto-jumping to the first match
leap.opts.safe_labels = {}

-- The below settings make Leap's highlighting a bit closer to what you've been
-- used to in Lightspeed.
vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
vim.api.nvim_set_hl(0, "LeapMatch", {
	fg = "white", -- for light themes, set to 'black' or similar
	bold = true,
	nocombine = true,
})
leap.opts.highlight_unlabeled_phase_one_targets = true

leap.opts.max_phase_one_targets = nil
leap.opts.highlight_unlabeled_phase_one_targets = false
leap.opts.max_highlighted_traversal_targets = 10
leap.opts.case_sensitive = false
leap.opts.substitute_chars = {}
leap.opts.special_keys = {
	repeat_search = "<enter>",
	next_phase_one_target = "<enter>",
	next_target = { "<enter>", ";" },
	prev_target = { "<tab>", "," },
	next_group = "<space>",
	prev_group = "<tab>",
	multi_accept = "<enter>",
	multi_revert = "<backspace>",
}
