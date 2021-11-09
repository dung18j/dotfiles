vim.cmd [[
	syntax on
	colorscheme nord
    set shortmess+=c

    " Code navigation shortcuts
    set signcolumn=yes

    autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
]]

dofile("/home/dungph/.dotfiles/nvim/lsp.lua")
dofile("/home/dungph/.dotfiles/nvim/cmp.lua")
dofile("/home/dungph/.dotfiles/nvim/rust.lua")
dofile("/home/dungph/.dotfiles/nvim/tree.lua")

local opt = vim.opt
local g = vim.g

local map = vim.api.nvim_set_keymap
map('n', 'L', 'l', {noremap = true})
map('n', 'H', 'h', {noremap = true})
map('n', 'l', 'w', {noremap = true})
map('n', 'h', 'b', {noremap = true})
map('n', 'q:', '<nop>', {noremap = true})

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
