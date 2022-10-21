local lsp = require("lspconfig")
local U = require("amf.plugins.lsp.utils")
local navic = require("nvim-navic")
vim.notify = require("notify")

---Common perf related flags for all the LSP servers
local flags = {
	allow_incremental_sync = true,
	debounce_text_changes = 200,
}

---Common capabilities including lsp snippets and autocompletion
local capabilities = U.capabilities()

---Common `on_attach` function for LSP servers
---@param client table
---@param buf integer
local function on_attach(client, buf)
	U.disable_formatting(client)
	U.mappings(buf)
	navic.attach(client, buf)
	vim.notify("LSP attached", "info", { title = client.name })
end

-- Disable LSP logging
vim.lsp.set_log_level(vim.lsp.log_levels.OFF)

-- Configuring native diagnostics
vim.diagnostic.config({
	virtual_text = {
		source = "always",
	},
	float = {
		source = "always",
	},
})

---List of the LSP server that don't need special configuration
local servers = {
	"gopls", -- Golang
	"tsserver", -- Typescript
	"html", -- HTML
	"cssls", -- CSS
	"jsonls", -- Json
	"yamlls", -- YAML
	"bashls", -- bashls
	"clangd", -- clangd
	"cmake", -- cmake
	"pyright", -- pyright
	"rust_analyzer", -- rust_analyzer
	"texlab", -- texlab
	"sumneko_lua", -- sumneko_lua
	"dockerls", -- dockerls
	"sqls", -- sqls
	"emmet_ls", -- emmet_ls
}

for _, server in ipairs(servers) do
	lsp[server].setup({
		flags = flags,
		capabilities = capabilities,
		on_attach = on_attach,
	})
end

-- NOTE: Using `eslint_d` via `null-ls` bcz it is way fasterrrrrrr.
-- Eslint
--[[ lsp.eslint.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        useESLintClass = true, -- Recommended for eslint >= 7
        run = 'onSave', -- Run `eslint` after save
    },
    -- NOTE: `root_dir` is required to fix the monorepo issue
    root_dir = require('lspconfig.util').find_git_ancestor,
}) ]]
