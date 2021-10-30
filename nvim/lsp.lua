vim.o.completeopt = "menuone,noselect"

require'lspconfig'.clangd.setup{}
require'lspsaga'.init_lsp_saga()
require'lspconfig'.rnix.setup{}
require'lspconfig'.sumneko_lua.setup{}

local map = vim.api.nvim_set_keymap

map('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
map('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true})
map('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap = true})
map('n', '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {noremap = true})
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true})
map('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', {noremap = true})
map('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', {noremap = true})
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
map('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true})
map('n', '<c-j>', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', {noremap = true})
map('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap = true})
map('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', {noremap = true})
