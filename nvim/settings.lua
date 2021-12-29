dofile("/home/dungph/.dotfiles/nvim/plugins.lua")
dofile("/home/dungph/.dotfiles/nvim/lsp.lua")
dofile("/home/dungph/.dotfiles/nvim/cmp.lua")
dofile("/home/dungph/.dotfiles/nvim/tree.lua")

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

-- ident characters
vim.g.indentLine_char_list = {'▏', '╎', '┆', '┊'}

-- Some keymap to get rid of mispress
local map = vim.api.nvim_set_keymap
map('n', 'q:', '<nop>', {noremap = true})
map('n', 'q', '<nop>', {noremap = true})
map('n', 'Q', 'q', {noremap = true})
map('n', '<c-a>', '<cmd>:terminal<CR>:setlocal nonumber norelativenumber<CR>i', {noremap = true})

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
require('crates').setup()
vim.ui.select = require"popui.ui-overrider"

