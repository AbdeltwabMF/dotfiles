-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})

return require("packer").startup({
	function(use)
		-- Package Manager --
		use("wbthomason/packer.nvim")

		-- Required plugins --
		use("nvim-lua/plenary.nvim")

		-- Notifier
		use({
			"rcarriga/nvim-notify",
			config = function()
				require("amf.plugins.notify")
			end,
		})
		use({
			"folke/noice.nvim",
			event = "VimEnter",
			config = function()
				require("amf.plugins.noice")
			end,
			requires = {
				-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
				"MunifTanjim/nui.nvim",
			},
		})

		-- Theme, Icons, Statusbar, Bufferbar --
		use({
			"akinsho/bufferline.nvim",
			tag = "v3.*",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("bufferline").setup()
			end,
		})
		use({
			"ellisonleao/gruvbox.nvim",
			config = function()
				require("amf.plugins.gruvbox")
			end,
		})
		use({
			"kyazdani42/nvim-web-devicons",
			config = function()
				require("nvim-web-devicons").setup()
			end,
		})
		use({
			"nvim-lualine/lualine.nvim",
			config = function()
				require("amf.plugins.lualine")
			end,
			requires = {
				"kyazdani42/nvim-web-devicons",
				opt = true,
			},
		})
		-- nui is a dependency of noice.nvim,
		use({ "MunifTanjim/nui.nvim" })
		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("amf.plugins.trouble")
			end,
		})
		use({
			"SmiteshP/nvim-navic",
			requires = "neovim/nvim-lspconfig",
		})
		use({
			"glepnir/dashboard-nvim",
			config = function()
				require("amf.plugins.dashboard")
			end,
		})

		-- Editor UI Niceties --
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "BufRead",
			config = function()
				require("amf.plugins.indentline")
			end,
		})
		use({
			"norcalli/nvim-colorizer.lua",
			event = "CursorHold",
			config = function()
				require("colorizer").setup()
			end,
		})
		use({
			"lewis6991/gitsigns.nvim",
			event = "BufRead",
			config = function()
				require("amf.plugins.gitsigns")
			end,
		})
		use({
			"rhysd/git-messenger.vim",
			event = "BufRead",
			config = function()
				require("amf.plugins.git-messenger")
			end,
		})
		use({
			"akinsho/toggleterm.nvim",
			tag = "*",
			config = function()
				require("amf.plugins.toggleterm")
			end,
		})

		-- Navigation and Fuzzy Search --
		use({
			"karb94/neoscroll.nvim",
			event = "WinScrolled",
			config = function()
				require("neoscroll").setup({ hide_cursor = false })
			end,
		})

		-- LSP
		use({
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup()
			end,
		})
		use({
			"williamboman/mason-lspconfig.nvim",
			after = "mason.nvim",
			config = function()
				require("amf.plugins.mason-lspconfig")
			end,
		})
		use({
			"neovim/nvim-lspconfig",
			config = function()
				require("amf.plugins.lsp.servers")
			end,
			after = "mason.nvim",
			event = "BufRead",
			requires = {
				{
					-- WARN: Unfortunately we won't be able to lazy load this
					"hrsh7th/cmp-nvim-lsp",
				},
			},
		})
		use({
			"RubixDev/mason-update-all",
			after = "mason.nvim",
			config = function()
				require("mason-update-all").setup()
			end,
		})

		-- DAP Protocol
		use({ "mfussenegger/nvim-dap" })
		use({
			"jayp0521/mason-nvim-dap.nvim",
			config = function()
				require("amf.plugins.lsp.mason-nvim-dap")
			end,
		})

		-- Completion
		use({
			{
				"hrsh7th/nvim-cmp",
				event = "InsertEnter",
				config = function()
					require("amf.plugins.cmp")
				end,
				requires = {
					{
						"L3MON4D3/LuaSnip",
						event = "InsertEnter",
						requires = {
							{
								"rafamadriz/friendly-snippets",
								event = "CursorHold",
							},
						},
					},
				},
			},
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
		})
		-- NOTE: nvim-autopairs needs to be loaded after nvim-cmp, so that <CR> would work properly
		use({
			"windwp/nvim-autopairs",
			event = "InsertCharPre",
			after = "nvim-cmp",
			config = function()
				require("amf.plugins.pairs")
			end,
		})
		use({ "github/copilot.vim" })

		-- Null-ls
		use({
			"jose-elias-alvarez/null-ls.nvim",
			event = "BufRead",
			config = function()
				require("amf.plugins.lsp.null-ls")
			end,
		})
		use({
			"jayp0521/mason-null-ls.nvim",
			config = function()
				require("amf.plugins.lsp.mason-null-ls")
			end,
		})

		-- File Manager
		use({
			"luukvbaal/nnn.nvim",
			config = function()
				require("amf.plugins.nnn")
			end,
		})
		use({
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			requires = {
				"nvim-lua/plenary.nvim",
				"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
			},
			config = function()
				require("amf.plugins.neotree")
			end,
		})

		-- Treesitter: Better Highlights
		use({
			{
				"nvim-treesitter/nvim-treesitter",
				event = "CursorHold",
				run = ":TSUpdate",
				config = function()
					require("amf.plugins.treesitter")
				end,
			},
			{ "nvim-treesitter/playground", after = "nvim-treesitter" },
			{ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
			{ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
			{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
			{ "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
			{ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" },
		})

		-- Editing to the MOON
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})
		use({
			"tpope/vim-surround",
			event = "BufRead",
			requires = {
				{
					"tpope/vim-repeat",
					event = "BufRead",
				},
			},
		})
		use({
			"wellle/targets.vim",
			event = "BufRead",
		})
		use({
			"AndrewRadev/splitjoin.vim",
			-- NOTE: splitjoin won't work with `BufRead` event
		})

		-- Search and Replace
		use({
			{
				"nvim-telescope/telescope.nvim",
				event = "CursorHold",
				config = function()
					require("amf.plugins.telescope")
				end,
			},
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				after = "telescope.nvim",
				run = "make",
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
			{
				"nvim-telescope/telescope-symbols.nvim",
				after = "telescope.nvim",
			},
		})
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
