-- Load default NvChad (Cukup sekali aja ya Goshujin-sama!)
require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- Daftar server (Lengkap: HTML, CSS, C++, Python, Java, JS/TS, dan Lua)
-- Sasuga Goshujin-sama pilihannya komplit banget! ✨(•̀ᴗ•́)و ̑̑✨
local servers = { "html", "cssls", "clangd", "pyright", "jdtls", "ts_ls", "lua_ls" }

-- Loop buat setup semua server pake config sakti NvChad
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    }
end

vim.lsp.config("lua_ls", { -- nvim 0.11
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,

    settings = {
        Lua = {
            diagnostics = {
                -- enable = false, -- Disable all diagnostics from lua_ls
                globals = { "vim", "love" },
            },
            workspace = {
                library = {
                    vim.fn.expand "$VIMRUNTIME/lua",
                    vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
                    vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/love2d/library",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})
