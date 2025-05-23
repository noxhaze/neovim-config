local opts = { noremap = true, silent = true }

vim.keymap.set("x", "<Leader>p", "\"_dP", opts)

-- vim.keymap.set('i', '<C-h>', '<Left>', opts)
-- vim.keymap.set('i', '<C-j>', '<Down>', opts)
-- vim.keymap.set('i', '<C-k>', '<Up>', opts)
-- vim.keymap.set('i', '<C-l>', '<Right>', opts)

vim.keymap.set('n', '<C-h>', '<cmd>TmuxNavigateLeft<crcustom_>', opts)
vim.keymap.set('n', '<C-j>', '<cmd>TmuxNavigateDown<cr>', opts)
vim.keymap.set('n', '<C-l>', '<cmd>TmuxNavigateRight<cr>', opts)
vim.keymap.set('n', '<C-k>', '<cmd>TmuxNavigateUp<cr>', opts)

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('i', '<C-e>', '<End>', opts)
vim.keymap.set('n', '<C-e>', ':Ouroboros<CR>', opts)
vim.keymap.set("n", "<leader>tt", ":lua require('toggle-checkbox').toggle()<CR>")
vim.keymap.set("n", "<C-b>", "<C-6>", opts)
vim.keymap.set("n", "<C-x>", "<cmd>bd<cr>", opts);

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.c', '*.h', '*.cpp', '*.hpp' },
  desc = 'Load :ClangSwitchSourcHeader command on entering of C/C++ Files',
  group = vim.api.nvim_create_augroup('cxx-source-switcher', { clear = true }),
  callback = function()
    vim.keymap.set('n', '<C-e>', ':ClangdSwitchSourceHeader<CR>', opts)
  end,
})
