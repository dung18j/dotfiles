local user_folder = os.getenv("HOME")

dofile(user_folder .. "/.config/nvim/lsp_clangd.lua")
dofile(user_folder .. "/.config/nvim/lsp_lua_ls.lua")
dofile(user_folder .. "/.config/nvim/lsp_rust.lua")
dofile(user_folder .. "/.config/nvim/lsp_cmp.lua")
dofile(user_folder .. "/.config/nvim/lsp_minuet.lua")
dofile(user_folder .. "/.config/nvim/lsp_copilot.lua")
dofile(user_folder .. "/.config/nvim/tree.lua")

vim.cmd("helptags ALL")
-- vim.cmd("set ls=1")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set notermguicolors")

-- Monochrome syntax
vim.cmd [[
    hi Normal       ctermfg=none ctermbg=none
    hi Comment      cterm=italic ctermfg=blue ctermbg=none
    hi LspInlayHint cterm=italic ctermfg=blue ctermbg=none
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

require 'FTerm'.setup({
  cmd        = vim.o.shell,
  border     = 'single',
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
})

local opts = { noremap = true, silent = true }
map('n', '<C-a>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
map('t', '<C-a>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.keymap.set('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
vim.keymap.set('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.keymap.set('n', 'gk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.keymap.set('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--vim.keymap.set('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--vim.keymap.set('n', '<space>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

vim.keymap.set('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--vim.keymap.set('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
vim.keymap.set('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.keymap.set('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
--vim.keymap.set('n', '<space>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
vim.keymap.set('n', '<space>[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.keymap.set('n', '<space>]', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.keymap.set('i', '<c-space>', function() vim.lsp.completion.get() end)
-- vim.keymap.set('i', '<s-tab>', function() vim.lsp.completion.get() end)

vim.cmd("autocmd FileType * setlocal foldmethod=manual")
vim.diagnostic.config({
  --virtual_text = true,
  virtual_lines = true
})
vim.lsp.inlay_hint.enable(true)
