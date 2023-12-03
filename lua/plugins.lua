return {
    {
        "neovim/nvim-lspconfig",
    },

    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("nvim-cmp")
        end,

        lazy = false,
    },

    {
        "hrsh7th/cmp-nvim-lsp",

        dependencies = {
            "nvim-cmp",
        },
    },

    {
        "hrsh7th/cmp-buffer",

        dependencies = {
            "nvim-cmp",
        },
    },

    {
        "hrsh7th/cmp-path",

        dependencies = {
            "nvim-cmp",
        },
    },

    {
        "hrsh7th/cmp-cmdline",

        dependencies = {
            "nvim-cmp",
        },
    },

    {
        "L3MON4D3/LuaSnip",
    },

    {
        "saadparwaiz1/cmp_luasnip",
    },


    -- end of cmp

    {
        "williamboman/mason.nvim",
        lazy = false
    },

    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
    },

    {
        "squarefrog/tomorrow-night.vim",
    },

    {
        "nvim-lua/plenary.nvim",
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            extensions_list = { "project" },
        },
        extension = {
            project = {
                hidden_files = true,
                theme = "dropdown",
                order_by = "asc",
                search_by = "title",
            },
        },

        lazy = false,

    },

    {
        "nvim-telescope/telescope-project.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            vim.cmd("TSUpdate")
        end,
        lazy = false,
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
        lazy = false,
    },

    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        config = function ()
            require("lualine").setup({
                options = {
                    theme = "ayu",
                },
            })
        end
    },

    {
        "NvChad/nvterm",
        config = function ()
            require("nvterm").setup()
        end
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function ()
            require("gitsigns").setup()
        end
    },

    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function ()
            require("bufferline").setup{}
        end
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons",
          "MunifTanjim/nui.nvim",
        },
        config = {
            filesystem = {
                filtered_items = {
                    hide_gitignored = false,
                    hide_hidden = false,
                    hide_dotfiles = false,
                    visible = true,
                }
            }
        },
    },

    {
        "NvChad/nvim-colorizer.lua",
        config = function ()
            require('colorizer').setup()
        end
    },

    {
        "numToStr/Comment.nvim",
        opts = {
            toggler = {
                line = "<Leader>/",
            },
            opleader = {
                line = "<Leader>/",
            },
        },
        lazy = false,
    },

    {
        "sainnhe/everforest",
    },

    {
        "2nthony/vitesse.nvim",
        dependencies = {
            "tjdevries/colorbuddy.nvim",
        },
    },

    {
        "metalelf0/jellybeans-nvim",
    },

    {
        "Shatur/neovim-ayu",
        config = function ()
            require("ayu").setup({
                mirage = false,
                overrides = {},
            })
        end
    },
}
