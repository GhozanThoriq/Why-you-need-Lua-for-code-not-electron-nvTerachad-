return {
    -- 1. Treesitter (Gabungin jadi satu aja, Goshujin-sama!)
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            ensure_installed = { "lua", "vim", "vimdoc", "java", "python", "cpp" },
            highlight = { enabled = true },
        },
    },

    -- 2. Conform (Formatter)
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        opts = require "configs.conform",
    },

    -- 3. LSP Config
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    -- 4. Codeium (AI Autocomplete biar kayak Copilot)
    {
        "Exafunction/codeium.nvim",
        event = "BufRead",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup {}
        end,
    },
    -- Linting
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require "configs.lint"
        end,
    },
    -- Numbers, mason-lspconfig!!
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require "configs.mason-lspconfig"
        end,
    },
    -- Mason-lint
    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy",
        dependencies = { "nvim-lint" },
        config = function()
            require "configs.mason-lint"
        end,
    },
}
