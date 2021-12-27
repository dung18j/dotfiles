vim.o.completeopt = "menu,menuone,noselect"
vim.g.rustfmt_autosave = true

local on_attach = function(client, bufnr)
    local _ = client;

    local function map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    map('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
    map('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
    map('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    map('n', '<space>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    map('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    map('n', '<space>[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    map('n', '<space>]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    map('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    map('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
end

vim.cmd("autocmd FileType solidity setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab")
require'lspconfig'.solidity_ls.setup{}

vim.cmd("autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab")
vim.cmd("autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab")
require'lspconfig'.tsserver.setup{
    root_dir = require'lspconfig'.util.root_pattern("packages.json", "yarn.lock", "lerna.json", ".git"),
    on_attach = on_attach,
    settings = {documentFormatting = true}
}

vim.cmd("autocmd FileType rust setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab")
require('crates').setup()
require('rust-tools').setup{
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
                procMacro = {
                    enable = false,
                }
            }
        },

        on_attach = on_attach
    },
}
