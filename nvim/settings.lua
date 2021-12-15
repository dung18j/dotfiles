local opt = vim.opt
local g = vim.g

vim.cmd [[
    let base16colorspace=256
    call plug#begin('~/.vim/plugged')
    Plug 'Yggdroot/indentLine'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'simrat39/rust-tools.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'shaunsingh/nord.nvim'
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'mfussenegger/nvim-jdtls'
    Plug 'tomlion/vim-solidity'
    Plug 'saecki/crates.nvim'
    Plug 'chriskempson/base16-vim'
    Plug 'mhinz/vim-signify'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
    Plug 'windwp/nvim-autopairs'
    Plug 'rust-lang/rust.vim'

    call plug#end()

    set shortmess+=c

    " Code navigation shortcuts
    set signcolumn=yes

    set termguicolors " this variable must be enabled for colors to be applied properly
   
    set clipboard+=unnamedplus

    colorscheme base16-tomorrow-night
]]

dofile("/home/dungph/.dotfiles/nvim/lsp.lua")
dofile("/home/dungph/.dotfiles/nvim/cmp.lua")
dofile("/home/dungph/.dotfiles/nvim/tree.lua")

local map = vim.api.nvim_set_keymap
map('n', 'q:', '<nop>', {noremap = true})
map('n', 'q', '<nop>', {noremap = true})
map('n', 'Q', 'q', {noremap = true})
map('n', '<c-a>', '<cmd>:terminal<CR>i', {noremap = true})

g.indentLine_char_list = {'▏', '╎', '┆', '┊'}

-- Nicer UI settings
opt.cursorline = true
opt.relativenumber = true
opt.number = true
opt.ignorecase = true
opt.smartcase = true

opt.smartindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.expandtab = true
opt.scrolloff = 3

-- Performance
opt.lazyredraw = true;
opt.shell = "fish"
opt.shadafile = "NONE"

require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,              -- false will disable the whole extension
    },
    autotag = {
        enable = true,
    },
}
require('nvim-autopairs').setup{}
