-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
})

return require('packer').startup({
	function(use)
		---------------------
		-- Package Manager --
		---------------------

		use('wbthomason/packer.nvim')

		----------------------
		-- Required plugins --
		----------------------

		use('nvim-lua/plenary.nvim')

		----------------------------------------
		-- Theme, Icons, Statusbar, Bufferbar --
		----------------------------------------

		use({
		    'kyazdani42/nvim-web-devicons',
		    config = function()
		        require('nvim-web-devicons').setup()
		    end,
		})

    use({'vim-airline/vim-airline'})

		---------------------------------
		-- Navigation and Fuzzy Search --
		---------------------------------

		use({
		    'karb94/neoscroll.nvim',
		    event = 'WinScrolled',
		    config = function()
		        require('neoscroll').setup({ hide_cursor = false })
		    end,
		})

    -------------------------
    -- ale
    -------------------------

    -- Load on a combination of conditions: specific filetypes or commands
    -- Also run code after load (see the "config" key)
    use {
      'w0rp/ale',
      ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
      cmd = 'ALEEnable',
      config = 'vim.cmd[[ALEEnable]]'
    }

    -------------------------
    -- Completion
    -------------------------
      
    use {
      'haorenW1025/completion-nvim',
      opt = true,
      requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
    }

    -------------------------
    -- File Manager - nnn
    -------------------------
    
    use({
      'mcchrish/nnn.vim'
    })

		-------------------------
		-- Editing to the MOON --
		-------------------------

		use('numToStr/prettierrc.nvim')

		use({
		    'tpope/vim-surround',
		    event = 'BufRead',
		    requires = {
		        {
		            'tpope/vim-repeat',
		            event = 'BufRead',
		        },
		    },
		})

		use({
		    'wellle/targets.vim',
		    event = 'BufRead',
		})

		use({
		    'AndrewRadev/splitjoin.vim',
		    -- NOTE: splitjoin won't work with `BufRead` event
		})

	end, 
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end,
    },
  },
})
