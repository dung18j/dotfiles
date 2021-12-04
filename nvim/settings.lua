vim.cmd [[
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
    Plug 'glepnir/lspsaga.nvim'
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'mfussenegger/nvim-jdtls'
    Plug 'tomlion/vim-solidity'
    call plug#end()

    syntax on
    set shortmess+=c

    " Code navigation shortcuts
    set signcolumn=yes

    autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
]]

dofile("/home/dungph/.dotfiles/nvim/lsp.lua")
dofile("/home/dungph/.dotfiles/nvim/cmp.lua")
--dofile("/home/dungph/.dotfiles/nvim/rust.lua")
dofile("/home/dungph/.dotfiles/nvim/tree.lua")
--dofile("/home/dungph/.dotfiles/nvim/jdtls.lua")

local opt = vim.opt
local g = vim.g

local map = vim.api.nvim_set_keymap
map('n', 'L', 'l', {noremap = true})
map('n', 'H', 'h', {noremap = true})
map('n', 'l', 'w', {noremap = true})
map('n', 'h', 'b', {noremap = true})

map('v', 'L', 'l', {noremap = true})
map('v', 'H', 'h', {noremap = true})
map('v', 'h', 'b', {noremap = true})
map('v', 'l', 'w', {noremap = true})
map('n', 'q:', '<nop>', {noremap = true})
map('n', 'q', '<nop>', {noremap = true})
map('n', 'Q', 'q', {noremap = true})

map('n', '<c-a>', '<cmd>:lua require("lspsaga.floaterm").open_float_terminal()<CR>', {noremap = true})
map('t', '<c-a>', '<cmd>:lua require("lspsaga.floaterm").close_float_terminal()<CR>', {noremap = true})

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

--require'nvim-treesitter.configs'.setup {
--    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
--    highlight = {
--        enable = true,              -- false will disable the whole extension
--    },
--    autotag = {
--        enable = true,
--    },
--}

vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = true
vim.g.nord_italic = false

require('nord').set()

vim.fn.sign_define("LspDiagnosticsSignError",
    {text = "❌", texthl = "LspDiagnosticsSignError"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
    {text = "⚠️", texthl = "LspDiagnosticsSignWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
    {text = "ℹ️", texthl = "LspDiagnosticsSignInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint",
    {text = "🔥", texthl = "LspDiagnosticsSignHint"})
vim.fn.sign_define("LspSagaLightBulb",
    {text="➡️", texthl="LspSagaLightBulbSign"})
vim.fn.sign_define("DiagnosticSignError",
    {text = "❌", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarning",
    {text = "⚠️", texthl = "DiagnosticSignWarning"})
vim.fn.sign_define("DiagnosticSignInformation",
    {text = "ℹ️", texthl = "DiagnosticSignInformation"})
vim.fn.sign_define("DiagnosticSignHint",
    {text = "🔥", texthl = "DiagnosticSignHint"})

