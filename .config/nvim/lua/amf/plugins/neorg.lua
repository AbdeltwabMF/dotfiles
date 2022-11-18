require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.norg.completion "] = {},
		["core.norg.concealer "] = {},
		["core.gtd.base "] = {},
		["core.export "] = {},
		["core.presenter "] = {},
		["core.norg.manoeuvre "] = {},
		["core.norg.dirman "] = {},
		["core.export.markdown "] = {},
		["core.integrations.telescope"] = {}, -- Enable the telescope module
		["external.context"] = {},
		["external.kanban"] = {
			task_states = {
				"undone",
				"done",
				"pending",
				"cancelled",
				"uncertain",
				"urgent",
				"recurring",
				"on_hold",
			},
		},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					work = "~/vault/documents/neorg/work",
					study = "~/vault/documents/neorg/study",
					personal = "~/vault/documents/neorg/personal",
				},
			},
		},
	},
})
