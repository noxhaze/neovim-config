return {
    { 'tpope/vim-sleuth' },
    { 'christoomey/vim-tmux-navigator', lazy = false },
    { 'nvim-tree/nvim-web-devicons' },
    { 'jakemason/ouroboros' },
    { 'numToStr/Comment.nvim',          opts = { toggler = { line = '<Leader>,' }, opleader = { line = '<Leader>,' } } },
    { "opdavies/toggle-checkbox.nvim" },

    {
        "slugbyte/lackluster.nvim",
        lazy = false,
        priority = 1000,
        init = function()
            vim.cmd.colorscheme("lackluster-mint")
        end,
    },
    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            -- See `:help telescope.builtin`
            local builtin = require 'telescope.builtin'
            local noPreview = require('telescope.themes').get_dropdown { previewer = false }
            vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
            vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
            vim.keymap.set('n', '<leader>ff', function() builtin.find_files(noPreview) end, { desc = '[F]ind [F]iles' })
            vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
            vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
            vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Search by Grep' })
            vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
            vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
            vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
            vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
            vim.keymap.set('n', '<leader><leader>', function() builtin.buffers(noPreview) end,
                { desc = '[F]ind existing [B]uffers' })
        end
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        opts = {
            ensure_installed = { 'bash', 'c', 'cpp', 'html', 'lua', 'luadoc', 'markdown', 'c_sharp', 'glsl', 'hlsl', 'css', 'gitignore', 'rust', 'ninja', 'zig', 'gdscript', 'gdshader' },
            auto_install = true,
            highlight = {
                enable = false,
                disable = { "mason" },
            },
            indent = {
                enable = false,
                disable = { "mason" },
            },
            additional_vim_regex_highlighting = false,
            file_ignore_patterns = { "mellow-glfw", "./mellow-glfw", "mellow-glfw/", "target/" },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
            vim.treesitter.language.register('glsl', { 'glsl', 'comp', 'vert', 'frag' })
            vim.treesitter.language.register('mason', { 'glsl', 'comp' })
        end,
    },

    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
}
