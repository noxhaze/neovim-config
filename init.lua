vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.showmode = false
vim.opt.mouse = 'a'

vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true

vim.opt.ignorecase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.termguicolors = true

vim.opt.cursorline = true

vim.opt.scrolloff = 15

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
require 'keymaps'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = require 'plugins'
require("lazy").setup(plugins)

require 'lsp'
vim.treesitter.language.register('glsl', { 'glsl', 'comp', 'vert', 'frag' })

vim.opt.termguicolors = true
vim.cmd.colorscheme 'industry'

vim.api.nvim_create_autocmd({ 'BufRead' }, {
  pattern = { '*.comp', '*.vert', '*.frag' },
  callback = function()
    vim.cmd.set('filetype=glsl');
  end
})

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { '*.c', '*.h', '*.hpp', '*.cpp', '*.lua', '*.rs' },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end
})

-- vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
--   pattern = { '*.lua', '*.rs' },
--   callback = function()
--     vim.lsp.buf.format({ async = false })
--   end
-- })

local ue5 = require("nvim-ue5")
ue5.setup({
  unreal_engine_path = "/home/maero/UnrealEngine5.5.4",
})
