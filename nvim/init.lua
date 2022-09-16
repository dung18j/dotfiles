local user_folder = os.getenv("HOME")

dofile(user_folder .. "/.config/nvim/plugins.lua")
dofile(user_folder .. "/.config/nvim/language.lua")
dofile(user_folder .. "/.config/nvim/cmp.lua")
dofile(user_folder .. "/.config/nvim/tree.lua")
dofile(user_folder .. "/.config/nvim/background.lua")

-- Monochrome syntax
vim.cmd [[
    hi BoldText cterm=bold

    hi! link Statement  BoldText
    hi! link Special    BoldText
    hi! link Type       BoldText
    hi! link Identifier Normal
    hi! link Constant   Normal
    hi! link Normal     Normal
    hi! link PreProc    Normal
    hi Pmenu            ctermfg=0 ctermbg=225 guibg=LightMagenta
    hi PmenuSel         ctermfg=0 ctermbg=7 guibg=Grey
    hi PmenuSbar        ctermbg=248 guibg=Grey
    hi PmenuThumb       ctermbg=0 guibg=Black
    "hi Pmenu            ctermfg=255 ctermbg=244
    "hi PmenuSel         ctermfg=black ctermbg=225
    "hi PmenuSbar        ctermbg=248
    "hi PmenuThumb       ctermbg=grey

    hi Comment          cterm=italic ctermfg=21
    hi Normal           ctermbg=none
    hi SignColumn       ctermbg=none
    hi Visual           cterm=none ctermbg=247
    hi CursorLine       cterm=none ctermbg=none
    hi CursorLineNr     cterm=none ctermfg=red ctermbg=none
    hi DiffAdd          ctermbg=none
    hi DiffChange       ctermbg=none
    hi DiffDelete       ctermbg=none
    hi DiffText         ctermbg=none
]]

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

-- Some keymap to get rid of mispress
local map = vim.api.nvim_set_keymap
map('n', 'q:', '<nop>', { noremap = true })
map('n', 'q', '<nop>', { noremap = true })
map('n', 'Q', 'q', { noremap = true })


require 'FTerm'.setup({
    border     = 'single',
    dimensions = {
        height = 0.9,
        width = 0.9,
    },
})

-- Example keybindings
local opts = { noremap = true, silent = true }
map('n', '<C-a>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
map('t', '<C-a>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

require 'nvim-treesitter.configs'.setup {
    ensure_installed = 'all',
    highlight = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
}

require('nvim-autopairs').setup {}

-- ident characters
vim.g.indentLine_char_list = { '▏', '╎', '┆', '┊' }

vim.cmd("autocmd FileType * setlocal foldmethod=manual")
