vim.o.completeopt = "menu,menuone,noselect"
vim.g.rustfmt_autosave = true

local on_attach = function(client, bufnr)
    local _ = client;

    local function map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    -- Mappings.
    local opts = { noremap = true, silent = true }

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
    map('n', '<space>[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    map('n', '<space>]', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
end

vim.cmd("autocmd FileType c setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab")
require 'lspconfig'.clangd.setup {
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    on_attach = on_attach
}

--require 'lspconfig'.java_language_server.setup {
--    on_attach = on_attach,
--    cmd = {
--        "/usr/share/java/java-language-server/lang_server_linux.sh"
--    }
--}

vim.cmd("autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab")
require 'lspconfig'.volar.setup {
    on_attach = on_attach,
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
}
--require 'lspconfig'.vuels.setup {
--    on_attach = on_attach,
--    filetypes = { 'vue' },
--    root_dir = require 'lspconfig'.util.root_pattern('package.json', 'vue.config.js'),
--    init_options = {
--        config = {
--            vetur = {
--                useWorkspaceDependencies = false,
--                validation = {
--                    template = true,
--                    style = true,
--                    script = true,
--                },
--                completion = {
--                    autoImport = false,
--                    useScaffoldSnippets = false,
--                    tagCasing = 'kebab',
--                },
--                format = {
--                    defaultFormatter = {
--                        js = 'prettier',
--                        ts = 'none',
--                    },
--                    defaultFormatterOptions = {},
--                    scriptInitialIndent = false,
--                    styleInitialIndent = false,
--                },
--            },
--            css = {},
--            html = {
--                suggest = {},
--            },
--            javascript = {
--                format = {},
--            },
--            typescript = {
--                format = {},
--            },
--            emmet = {},
--            stylusSupremacy = {},
--        },
--    }
--}

require 'lspconfig'.jdtls.setup {
    on_attach = on_attach
}

vim.cmd("autocmd FileType sql setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab")

vim.cmd("autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab")
vim.cmd("autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab")
require 'lspconfig'.tsserver.setup {
    root_dir = require 'lspconfig'.util.root_pattern("packages.json", "yarn.lock", "lerna.json", ".git"),
    on_attach = on_attach,
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    settings = { documentFormatting = true }
}

vim.cmd("autocmd FileType html setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab")
vim.cmd("autocmd FileType htmldjango setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab")
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require 'lspconfig'.html.setup {
    cmd = { "vscode-html-languageserver", "--stdio" },
    filetypes = { "html", "htmldjango" },
    capabilities = capabilities,
    on_attach = on_attach,
}

vim.cmd("autocmd FileType rust setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab")
require('crates').setup()
require('rust-tools').setup {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
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
                    enable = true,
                }
            }
        },

        on_attach = on_attach
    },
}

local map = vim.api.nvim_set_keymap
-- Mappings.
local opts = { noremap = true, silent = true }

-- See `:help vim.lsp.*` for documentation on any of the below functions
map('n', '<space>b', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)
map('n', '<space>c', '<cmd>lua require"dap".continue()<CR>', opts)
map('n', '<space>s', '<cmd>lua require"dap".step_over()<CR>', opts)
map('n', '<space>b', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)

map('n', '<F5>', '<cmd>lua require"dap".continue()<CR>', opts)
map('n', '<F10>', '<cmd>lua require"dap".step_over()<CR>', opts)
map('n', '<F11>', '<cmd>lua require"dap".step_into()<CR>', opts)
map('n', '<F12>', '<cmd>lua require"dap".step_out()<CR>', opts)
map('n', '<space>b', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)
map('n', '<space>B', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
map('n', '<space>lp', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: ")<CR>', opts)
map('n', '<space>dr', '<cmd>lua require"dap".repl.open()<CR>', opts)
map('n', '<space>dl', '<cmd>lua require"dap".run_last()<CR>', opts)

local dap = require('dap')
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode', -- adjust as needed
    name = "lldb"
}

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},

        -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
        --
        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        --
        -- Otherwise you might get the following error:
        --
        --    Error on launch: Failed to attach to the target process
        --
        -- But you should be aware of the implications:
        -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
        runInTerminal = false,
    },
}


-- If you want to use this for rust and c, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require 'lspconfig'.sumneko_lua.setup {
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
