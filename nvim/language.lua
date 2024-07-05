vim.o.completeopt = "menu,menuone,noselect"
vim.g.rustfmt_autosave = true

vim.cmd("autocmd FileType c setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab")
vim.cmd("autocmd FileType nix setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab")
vim.cmd("autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab")
vim.cmd("autocmd FileType sql setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab")
vim.cmd("autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab")
vim.cmd("autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab")
vim.cmd("autocmd FileType html setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab")
vim.cmd("autocmd FileType htmldjango setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab")
vim.cmd("autocmd FileType rust setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab")

local on_attach = function(client, bufnr)
    local _ = client;

    local function map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local opts = { noremap = true, silent = true }
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
    map('n', '<space>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
    map('n', '<space>[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    map('n', '<space>]', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
end

require 'lspconfig'.clangd.setup {
    on_attach = on_attach
}

require 'lspconfig'.jdtls.setup {
    on_attach = on_attach
}

require 'lspconfig'.tsserver.setup {
    root_dir = require 'lspconfig'.util.root_pattern("packages.json", "yarn.lock", "lerna.json", ".git"),
    on_attach = on_attach,
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    settings = { documentFormatting = true }
}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require 'lspconfig'.html.setup {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html", "htmldjango" },
    capabilities = capabilities,
    on_attach = on_attach,
}

require('crates').setup()
require 'lspconfig'.rust_analyzer.setup {
    on_attach = on_attach,
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = false,
            },
            checkOnSave = {
                command = "clippy"
            },
            procMacro = {
                enable = true,
            }
        }
    }
}
require 'lspconfig'.nixd.setup {
    on_attach = on_attach
}
require 'lspconfig'.lua_ls.setup {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    log_level = 2,
    root_dir = require 'lspconfig'.util.root_pattern(".git"), -- or bufdir,
    settings = {
        Lua = {
            telemetry = {
                enable = false
            },
            diagnostics = {
                globals = { 'vim' }
            }

        }
    },
    single_file_support = true,
    on_attach = on_attach
}
vim.cmd [[
    " This is necessary for VimTeX to load properly. The "indent" is optional.
    " Note that most plugin managers will do this automatically.
    filetype plugin indent on

    " This enables Vim's and neovim's syntax-related features. Without this, some
    " VimTeX features will not work (see ":help vimtex-requirements" for more
    " info).
    syntax enable

    " Viewer options: One may configure the viewer either by specifying a built-in
    " viewer method:
    let g:vimtex_view_method = 'zathura'

    " Or with a generic interface:
    let g:vimtex_view_general_viewer = 'okular'
    let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

    " VimTeX uses latexmk as the default compiler backend. If you use it, which is
    " strongly recommended, you probably don't need to configure anything. If you
    " want another compiler backend, you can change it as follows. The list of
    " supported backends and further explanation is provided in the documentation,
    " see ":help vimtex-compiler".
    let g:vimtex_compiler_method = 'latexrun'

    " Most VimTeX mappings rely on localleader and this can be changed with the
    " following line. The default is usually fine and is the symbol "\".
    let maplocalleader = ","
]]
