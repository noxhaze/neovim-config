require("nvim-treesitter.configs").setup {
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn", -- set to `false` to disable one of the mappings
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        }
    },

    ensure_installed = {
        "bash",
        "comment",
        "css",
        "cpp",
        "c",
        "c_sharp",
        "lua",
        "markdown",
        "toml",
        "typescript",
        "javascript",
        "html",
        "json",
        "scss",
        "svelte",
        "glsl",
        "gitcommit",
        "gitignore",
        "make",
        "org",
        "rust",
        "markdown_inline",
        "gdscript",
        "godot_resource",
    },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
