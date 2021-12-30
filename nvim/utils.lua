require'FTerm'.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})
-- Example keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', '<C-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
map('t', '<C-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

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

-- ident characters
vim.g.indentLine_char_list = {'▏', '╎', '┆', '┊'}


