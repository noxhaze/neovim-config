vim.g.mapleader = " "

vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.tabstop = 4;
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true

vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = false

vim.api.nvim_replace_termcodes('<C-\\><C-N>', true, true, true)
vim.g.loaded_python3_provider = 0

local opts = {
    noremap = true,
    silent = true,
}

vim.keymap.set('i', "<C-h>", "<Left>", opts);
vim.keymap.set('i', "<C-j>", "<Down>", opts);
vim.keymap.set('i', "<C-k>", "<Up>", opts);
vim.keymap.set('i', "<C-l>", "<Right>", opts);

vim.keymap.set('i', "<C-e>", "<End>", opts);

vim.keymap.set('n', "<C-h>", "<cmd>TmuxNavigateLeft<cr>", opts);
vim.keymap.set('n', "<C-j>", "<cmd>TmuxNavigateDown<cr>", opts);
vim.keymap.set('n', "<C-l>", "<cmd>TmuxNavigateRight<cr>", opts);
vim.keymap.set('n', "<C-k>", "<cmd>TmuxNavigateUp<cr>", opts);

vim.keymap.set("n", "<Leader>ff",
    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    opts);
vim.keymap.set("n", "<Leader>fs", "<cmd>Telescope live_grep theme=ivy<cr>", opts);
vim.keymap.set("n", "<Leader>FF", "<cmd>Telescope find_files<cr>", opts);
vim.keymap.set("n", "<Leader>FB", "<cmd>Telescope buffers<cr>", opts);
vim.keymap.set("n", "<Leader>fb",
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    opts);
vim.keymap.set("n", "<C-p>", ":lua require('telescope').extensions.project.project{}<CR>", opts);

vim.keymap.set("n", "<Leader>h", ":lua require('nvterm.terminal').new 'horizontal'<CR>", opts)
vim.keymap.set("n", "<Leader>v", ":lua require('nvterm.terminal').new 'vertical'<CR>", opts)
vim.keymap.set("n", "<A-h>", ":lua require('nvterm.terminal').toggle 'horizontal'<CR>", opts);
vim.keymap.set("n", "<A-v>", ":lua require('nvterm.terminal').toggle 'vertical'<CR>", opts);
vim.keymap.set("t", "<C-x>", "<C-\\><C-N>", opts)
vim.keymap.set("t", "<A-h>", "<C-\\><C-N> :lua require('nvterm.terminal').toggle 'horizontal'<CR>", opts)
vim.keymap.set("t", "<A-v>", "<C-\\><C-N> :lua require('nvterm.terminal').toggle 'vertical'<CR>", opts)

vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "<Leader>x", ":bp <BAR> bd #<CR>", opts)

vim.keymap.set("n", "<C-e>", ":Ouroboros<CR>", opts);
vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", opts)

vim.keymap.set("n", "<C-b>", "0f(bvt(y:Ouroboros<CR>/<C-r>0<CR>mm :Ouroboros<CR>0f(vf)y:Ouroboros<CR>`m0f(vf)p :w<CR> :Ouroboros<CR>", opts)
vim.keymap.set('n', '<leader>tt', ":lua require('toggle-checkbox').toggle()<CR>", opts);

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

local plugins = require("plugins")
require("lazy").setup(plugins, opts)
require("lsp")

vim.cmd("colorscheme kanagawa-dragon")
