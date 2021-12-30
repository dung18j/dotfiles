dofile("/home/dungph/.dotfiles/nvim/plugins.lua")
dofile("/home/dungph/.dotfiles/nvim/lsp.lua")
dofile("/home/dungph/.dotfiles/nvim/cmp.lua")
dofile("/home/dungph/.dotfiles/nvim/tree.lua")
dofile("/home/dungph/.dotfiles/nvim/utils.lua")

-- Nicer UI settings
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.scrolloff = 3

-- Performance
vim.opt.lazyredraw = true;
vim.opt.shell = "fish"
vim.opt.shadafile = "NONE"

-- Enable mouse
vim.opt.mouse = 'a';

-- Enable clipboard
vim.opt.clipboard = 'unnamedplus'

-- Colorscheme: gruvbox, medium dark
vim.cmd([[
    if has('termguicolors')
        set termguicolors
    endif
    let g:gruvbox_material_background = 'medium'
    set background=dark
    colorscheme gruvbox-material
]])

-- Some keymap to get rid of mispress
local map = vim.api.nvim_set_keymap
map('n', 'q:', '<nop>', {noremap = true})
map('n', 'q', '<nop>', {noremap = true})
map('n', 'Q', 'q', {noremap = true})

vim.ui.select = require"popui.ui-overrider"
