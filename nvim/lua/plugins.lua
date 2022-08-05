local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Sensible Vim defaults
Plug('tpope/vim-sensible')

-- Fzf plugin
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})

-- Vim surround
Plug('tpope/vim-surround')

-- Lua dependencies for other plugins
Plug('nvim-lua/plenary.nvim')

-- Floating window searcher for lists
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.0' })
Plug('nvim-telescope/telescope-fzf-native.nvim')

-- Ripgrep
Plug('BurntSushi/ripgrep')

-- Dev icons
Plug('kyazdani42/nvim-web-devicons')

-- File explorer
Plug('kyazdani42/nvim-tree.lua')

-- Auto pairs
Plug('windwp/nvim-autopairs')

-- Dashboard greeter
Plug('glepnir/dashboard-nvim')

-- Status line
Plug('nvim-lualine/lualine.nvim')

-- Treesitter
Plug('nvim-treesitter/nvim-treesitter')

-- Vim Hop
Plug('phaazon/hop.nvim')

-- Bufferline for nvim
Plug('akinsho/bufferline.nvim')

-- Snippets
Plug 'SirVer/ultisnips'

-- LSP/Autocomplete plugin
Plug('neovim/nvim-lspconfig')
Plug('liuchengxu/vista.vim')    -- Taglist LSP alternative
Plug('hrsh7th/cmp-path') 
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-nvim-lsp')
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug('hrsh7th/nvim-cmp')        -- NVIM LSP completion engine
Plug('neovim/nvim-lspconfig')
Plug('williamboman/mason.nvim') -- LSP/etc... installer
Plug('williamboman/mason-lspconfig.nvim')
	-- " use 'jose-elias-alvarez/null-ls.nvim'
	-- use 'hrsh7th/cmp-nvim-lsp'

-- Linting
Plug('mfussenegger/nvim-lint')

-- Themes
Plug('navarasu/onedark.nvim')


vim.call('plug#end')
