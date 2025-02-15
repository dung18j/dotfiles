local user_folder = os.getenv("HOME")

dofile(user_folder .. "/.config/nvim/language.lua")
dofile(user_folder .. "/.config/nvim/cmp.lua")
dofile(user_folder .. "/.config/nvim/tree.lua")

vim.cmd("helptags ALL")
-- vim.cmd("set ls=1")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set notermguicolors")

-- Monochrome syntax
vim.cmd [[
    hi Normal       ctermfg=none ctermbg=none
    hi Comment      cterm=italic ctermfg=blue ctermbg=none
    hi Statement    cterm=bold
    hi Special      cterm=bold
    hi Type         cterm=bold
    hi Function     ctermfg=none ctermbg=none
    hi Identifier   ctermfg=none ctermbg=none
    hi Constant     ctermfg=none ctermbg=none
    hi PreProc      ctermfg=none ctermbg=none

    hi Pmenu        ctermfg=0 ctermbg=225
    hi PmenuSel     ctermfg=0 ctermbg=7
    hi PmenuSbar    ctermbg=248
    hi PmenuThumb   ctermbg=0

    hi SignColumn   ctermbg=none
    hi Visual       cterm=none ctermbg=247
    hi CursorLine   cterm=none ctermbg=none
    hi CursorLineNr cterm=none ctermfg=red ctermbg=none
    hi DiffAdd      ctermbg=none
    hi DiffChange   ctermbg=none
    hi DiffDelete   ctermbg=none
    hi DiffText     ctermbg=none
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

vim.g.indentLine_char_list = { '▏', '╎', '┆', '┊' }
