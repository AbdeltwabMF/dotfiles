require("mason-null-ls").setup({
	ensure_installed = {
		"stylua", -- lua formatter
		"cpplint", -- c++ linter
		"clang_format", -- c++ formatter
		"hadolint", -- dockerfile linter
		"gitlint", -- git commit linter
		"gofumpt", -- go formatter
		"eslint_d", -- javascript linter
		"prettierd", -- javascript formatter
		"jq", -- json formatter
		"markdownlint", -- markdown linter
		"shellcheck", -- shell linter
		"shfmt", -- shell formatter
		"solhint", -- solidity linter
		"sql_formatter", -- sql formatter
		"yamlfmt", -- yaml formatter
		"standardrb", -- ruby formatter
		"pylint", -- python linter
		"misspell", -- markdown linter
	},
})
