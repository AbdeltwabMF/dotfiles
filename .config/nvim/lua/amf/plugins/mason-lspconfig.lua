require("mason-lspconfig").setup({
	ensure_installed = { 
		"sumneko_lua", -- Lua
		"rust_analyzer", -- Rust
		"clangd", -- C/C++
		"bashls", -- Bash
		"cmake", -- CMake
		"html", -- HTML
		"marksman", -- Markdown
		"pyright", -- Python
		"cssls", -- CSS
		"ltex", -- LaTeX
		"ruby_ls", -- Ruby
		"sqlls", -- SQL
		"solidity", -- Solidity
		"tailwindcss", -- TailwindCSS
		"tsserver", -- TypeScript
		"yamlls", -- YAML
		"jdtls", -- Java
		"jsonls", -- JSON
		"gopls", -- Go
		"dockerls", -- Docker
	},
})
