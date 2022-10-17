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

		-- Theme, Icons, Statusbar, Bufferbar --
		use({
			"ellisonleao/gruvbox.nvim",
			config = function()
				require("profile.plugins.gruvbox")
			end,
		})
		use({
			"kyazdani42/nvim-web-devicons",
			config = function()
				require("nvim-web-devicons").setup()
			end,
		})
		use({ "vim-airline/vim-airline" })

		-- Editor UI Niceties --
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "BufRead",
			config = function()
				require("profile.plugins.indentline")
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
				require("profile.plugins.gitsigns")
			end,
		})
		use({
			"rhysd/git-messenger.vim",
			event = "BufRead",
			config = function()
				require("profile.plugins.git-messenger")
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

		-- ale
		-- Load on a combination of conditions: specific filetypes or commands
		-- Also run code after load (see the "config" key)
		use({
			"w0rp/ale",
			ft = { "sh", "zsh", "bash", "c", "cpp", "cmake", "html", "markdown", "racket", "vim", "tex" },
			cmd = "ALEEnable",
			config = "vim.cmd[[ALEEnable]]",
		})

		-- Completion
		use({
			"williamboman/nvim-lsp-installer",
		})
		use({
			"neovim/nvim-lspconfig",
			event = "BufRead",
			config = function()
				require("profile.plugins.lsp.servers")
			end,
			requires = {
				{
					-- WARN: Unfortunately we won't be able to lazy load this
					"hrsh7th/cmp-nvim-lsp",
				},
			},
		})
		use({
			"jose-elias-alvarez/null-ls.nvim",
			event = "BufRead",
			config = function()
				require("profile.plugins.lsp.null-ls")
			end,
		})
		use({
			{
				"hrsh7th/nvim-cmp",
				event = "InsertEnter",
				config = function()
					require("profile.plugins.lsp.nvim-cmp")
				end,
				requires = {
					{
						"L3MON4D3/LuaSnip",
						event = "InsertEnter",
						config = function()
							require("profile.plugins.lsp.luasnip")
						end,
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
		})
		-- NOTE: nvim-autopairs needs to be loaded after nvim-cmp, so that <CR> would work properly
		use({
			"windwp/nvim-autopairs",
			event = "InsertCharPre",
			after = "nvim-cmp",
			config = function()
				require("profile.plugins.pairs")
			end,
		})

		-- Development
		use({ "github/copilot.vim" })

		-- File Manager - nnn
		use({
			"luukvbaal/nnn.nvim",
			config = function()
				require("profile.plugins.nnn")
			end,
		})

		-- Treesitter: Better Highlights --
		use({
			{
				"nvim-treesitter/nvim-treesitter",
				event = "CursorHold",
				run = ":TSUpdate",
				config = function()
					require("profile.plugins.treesitter")
				end,
			},
			{ "nvim-treesitter/playground", after = "nvim-treesitter" },
			{ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
			{ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
			{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
			{ "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
		})

		-- Editing to the MOON --
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})
		use({ "numToStr/prettierrc.nvim" })
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

		-- Utilities
		use({
			{
				"nvim-telescope/telescope.nvim",
				event = "CursorHold",
				config = function()
					require("profile.plugins.telescope")
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
