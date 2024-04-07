-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

local incline = require 'custom.plugins.incline-custom'
local autopairs = require 'custom.plugins.autopairs'

return {
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },

  {
    'jakemason/ouroboros',
  },

  {
    'rebelot/kanagawa.nvim',
    config = function()
      require('kanagawa').setup {
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none',
              },
            },
          },
        },
      }
    end,
  },

  {
    'opdavies/toggle-checkbox.nvim',
  },

  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup {}
    end,
  },

  incline,
  autopairs,
}
