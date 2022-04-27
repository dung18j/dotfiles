local user_folder = os.getenv("HOME")

dofile(user_folder .. "/.config/nvim/plugins.lua")
dofile(user_folder .. "/.config/nvim/language.lua")
dofile(user_folder .. "/.config/nvim/cmp.lua")
dofile(user_folder .. "/.config/nvim/tree.lua")
--dofile(user_folder .. "/.config/nvim/utils.lua")

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
    let g:everforest_transparent_background = 1
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


require'FTerm'.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})

-- Example keybindings
local opts = { noremap = true, silent = true }
map('n', '<C-a>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
map('t', '<C-a>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

require'nvim-treesitter.configs'.setup {
    ensure_installed = {'rust', 'lua', 'toml', 'json', 'c', 'java', 'html'},
    highdark = {
        enable = true,              -- false will disable the whole extension
    },
    autotag = {
        enable = true,
    },
}

require('nvim-autopairs').setup{}

-- ident characters
vim.g.indentLine_char_list = {'▏', '╎', '┆', '┊'}

vim.cmd("autocmd FileType * setlocal foldmethod=manual")
