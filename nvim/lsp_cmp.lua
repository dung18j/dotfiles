vim.o.completeopt = "menu,menuone,noselect"

require('nvim-autopairs').setup {}

-- ---@diagnostic disable: need-check-nil
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client:supports_method('textDocument/completion') then
--       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--     end
--   end,
-- })
-- 
-- vim.api.nvim_create_autocmd('InsertCharPre', {
--   buffer = vim.api.nvim_get_current_buf(),
--   callback = function()
--     vim.lsp.completion.get()
--   end
-- })
-- 
-- vim.keymap.set('i', '<Tab>', function()
--   return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
-- end, { expr = true })
-- 
-- vim.keymap.set('i', '<S-Tab>', function()
--   return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
-- end, { expr = true })
-- 
-- vim.o.winborder = 'rounded'



local cmp = require 'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),

    ['<C-k>'] = cmp.mapping.scroll_docs(-4),
    ['<C-j>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },
  -- performance = {
  --   -- It is recommended to increase the timeout duration due to
  --   -- the typically slower response speed of LLMs compared to
  --   -- other completion sources. This is not needed when you only
  --   -- need manual completion.
  --   fetching_timeout = 2000,
  -- },
  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    --{ name = 'buffer' },
    { name = 'crates' },
  },
})
