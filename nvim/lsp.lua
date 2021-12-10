vim.o.completeopt = "menuone,noinsert,noselect"
vim.g.rustfmt_autosave = true

local on_attach = function(client, bufnr)
  local function map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  map('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  map('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  map('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  map('n', '<c-j>', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  map('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  map('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

end



require'lspconfig'.clangd.setup{
    on_attach = on_attach
}
require'lspsaga'.init_lsp_saga{
    code_action_prompt = {
       enable = false,
       sign = false,
       sign_priority = 20,
       virtual_text = false,
     },

}
require'lspconfig'.solang.setup{
    cmd = { "solang", "--language-server", "--target", "ewasm" },
    filetypes = { "solidity" },
    on_attach = on_attach,
    root_dir = require'lspconfig'.util.root_pattern("package.json", ".git")
}

require'lspconfig'.jdtls.setup{
    on_attach = on_attach
}

require'lspconfig'.tsserver.setup{
    root_dir = require'lspconfig'.util.root_pattern("packages.json", "yarn.lock", "lerna.json", ".git"),
    on_attach = on_attach,
    settings = {documentFormatting = true}
}

local opts = {
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
            }
        },

        on_attach = on_attach
    },
}

require('rust-tools').setup(opts)
require'lspconfig'.sumneko_lua.setup{
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    log_level = 2,
    root_dir = require'lspconfig'.util.root_pattern(".git") or bufdir,
    settings = {
      Lua = {
        telemetry = {
          enable = false
        },
        diagnostic = {
            globals = { 'vim' }
        }
      }
    },
    single_file_support = true,
    on_attach = on_attach
}
