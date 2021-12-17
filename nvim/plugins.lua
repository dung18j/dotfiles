local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.vim/plugged')
Plug 'Yggdroot/indentLine'
Plug 'windwp/nvim-autopairs'

Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/vim-vsnip'

Plug 'saecki/crates.nvim'
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'mfussenegger/nvim-jdtls'

Plug 'tomlion/vim-solidity'

Plug 'sainnhe/gruvbox-material'

Plug 'mhinz/vim-signify'
vim.call('plug#end')
