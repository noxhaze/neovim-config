local group = vim.api.nvim_create_augroup("LspMappings", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }

    vim.keymap.set('n', 'rn', vim.lsp.buf.rename, { buffer = bufnr })
    vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, { buffer = bufnr })
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  end,
})

local def_capabilites = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config.lua_ls = {
  capabilities = def_capabilites,
}

vim.lsp.config.bashls = {
  capabilities = def_capabilites,
}

vim.lsp.config.zls = {
  capabilities = def_capabilites,
}

vim.lsp.config.rust_analyzer = {
  capabilities = def_capabilites,
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        targetDir = "target/rust-analyzer",
      },
      files = {
        excludeDirs = {
          "target/rust-analyzer",
        },
      },
    }
  },
}

vim.lsp.config.clangd = {
  cmd = { 'clangd', '--header-insertion=never' },
  capabilities = def_capabilites,
}

vim.lsp.config.glsl_analyzer = {
  capabilities = def_capabilites,
}


vim.lsp.enable({ 'lua_ls', 'bashls', 'zls', 'rust_analyzer', 'glsl_analyzer', 'clangd' })

vim.diagnostic.config({
  signs = true,
  virtual_text = true,
})


local cmp = require 'cmp'
local luasnip = require 'luasnip'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
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
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})
