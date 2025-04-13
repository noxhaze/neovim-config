local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
  vim.keymap.set('n', 'rn', vim.lsp.buf.rename, { buffer = bufnr })
  vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, { buffer = bufnr })
end)

local def_capabilites = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require 'lspconfig'

lspconfig.bashls.setup({
  capabilities = def_capabilities,
})

lspconfig.lua_ls.setup({
  capabilities = def_capabilities,
})

lspconfig.zls.setup({
  capabilities = def_capabilities,
})

lspconfig.clangd.setup({
  cmd = { 'clangd', '--header-insertion=never' },
  capabilities = def_capabilities,
})

lspconfig.rust_analyzer.setup({
  capabilities = def_capabilites,
})

lspconfig.ols.setup({
  capabilities = def_capabilites,
})

lspconfig.glsl_analyzer.setup({
  capabilities = def_capabilites,
})

lspconfig.gdscript.setup({
  capabilities = def_capabilites,
})

lspconfig.ols.setup({
  capabilities = def_capabilites,
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
