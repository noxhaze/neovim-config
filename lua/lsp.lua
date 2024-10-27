local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
  vim.keymap.set('n', 'rn', vim.lsp.buf.rename, { buffer = bufnr })
  vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, { buffer = bufnr })
end)
-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'glsl_analyzer',
    'clangd',
    'lua_ls',
    'omnisharp',
    'bashls',
    'cmake',
    'rust_analyzer',
    'zls',
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

require('lspconfig').clangd.setup({
  cmd = { 'clangd', '-header-insertion=never' }
})

local cmp = require 'cmp'
local luasnip = require 'luasnip'
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<S-Cr>"] = cmp.mapping.confirm({ select = true }),
    ['<C-l>'] = cmp.mapping(function()
      if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { 'i', 's' }),
    ['<C-h>'] = cmp.mapping(function()
      if luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { 'i', 's' }),
  })
})
