local user_folder = os.getenv("HOME")

dofile(user_folder .. "/.config/nvim/plugins.lua")
dofile(user_folder .. "/.config/nvim/language.lua")
dofile(user_folder .. "/.config/nvim/cmp.lua")
dofile(user_folder .. "/.config/nvim/tree.lua")
dofile(user_folder .. "/.config/nvim/utils.lua")

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
    colorscheme everforest
    set background=dark
]])

-- Some keymap to get rid of mispress
local map = vim.api.nvim_set_keymap
map('n', 'q:', '<nop>', {noremap = true})
map('n', 'q', '<nop>', {noremap = true})
map('n', 'Q', 'q', {noremap = true})
