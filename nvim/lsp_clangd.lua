vim.cmd("autocmd FileType c setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab")
vim.cmd("autocmd FileType cc setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab")
vim.cmd("autocmd FileType cpp setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab")

vim.lsp.config.clangd = {
  capabilities = {
    offsetEncoding = { "utf-8", "utf-16" },
    textDocument = {
      completion = {
        editsNearCursor = true,
        completionItem = {
          snippetSupport = true,
        }
      },
      codeAction = {
        dataSupport              = true,
        documentationSupport     = true,
        dynamicRegistration      = true,
        honorsChangeAnnotations  = true,
        isPreferredSupport       = true,
      },
      implementation = {
        dynamicRegistration = true,
        linkSupport = true,

      },
      codeLens = {
        dynamicRegistration = true,
      },
      inlayHint = {
        dynamicRegistration = true,
      }
    },


  },
  cmd = { "clangd", "--completion-style=detailed" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  root_markers = { ".clangd", ".clang-tidy", ".clang-format", "compile_commands.json", "compile_flags.txt", "configure.ac", ".git" },
  settings = {
  }
}

vim.lsp.enable('clangd')
