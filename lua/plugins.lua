-- lua/plugins.lua
local plugins = {

    -- 1. Supermaven
    {
        "supermaven-inc/supermaven-nvim",
        lazy = false,
        config = function()
            require("supermaven-nvim").setup {
                keymaps = {
                    accept_suggestion = "<Tab>",
                },
            }
        end,
    }, -- Koma di sini buat misahin item di dalam table

    -- 2. Codeium
    {
        "Exafunction/codeium.nvim",
        event = "InsertEnter",
        dependencies = { "nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp" },
        config = function()
            require("codeium").setup {}
        end,
    },

    -- 3. Copilot
    {
        "zbirenbaum/copilot.lua",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("copilot").setup {
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    keymap = { accept = "<M-l>" },
                },
            }
        end,
    },
} -- PENUTUP TABLE UTAMA HARUS DI SINI!

return plugins
