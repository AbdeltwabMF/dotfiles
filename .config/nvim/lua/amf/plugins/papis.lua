require("papis").setup({
	-- These are configuration options of the `papis` program relevant to papis.nvim.
	-- Papis.nvim can get them automatically from papis, but this is very slow. It is
	-- recommended to copy the relevant settings from your papis configuration file.
	papis_python = {
		dir = "/home/amf/vault/documents/tex/biblio",
		info_name = "info.yaml", -- (when setting papis options `-` is replaced with `_`
		-- in the keys names)
		notes_name = [[notes.norg]],
	},
	-- Enable the default keymaps
	enable_keymaps = true,
})
