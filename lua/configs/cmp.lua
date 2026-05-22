local cmp = require "cmp"

local options = {
    completion = {
        completeopt = "menu,menuone,noselect",
    },

    -- 1. Biar Codeium muncul di kotak dropdown
    sources = {
        { name = "nvim_lsp" },
        { name = "codeium" }, -- Sasuga AI! ✨
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },

    -- 2. Mapping biar Gak Konflik (Tab = Menu, AI = Right Arrow/Alt+L)
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),

        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item() -- Navigasi menu root/ core
            elseif require("luasnip").expand_or_jumpable() then
                require("luasnip").expand_or_jump() -- JDTLS snippet
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
                require("luasnip").jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
}

-- Jangan lupa balikin options-nya biar dibaca NvChad!
return options
