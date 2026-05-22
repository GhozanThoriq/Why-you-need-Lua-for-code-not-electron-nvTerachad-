require "nvchad.options"

local o = vim.o

-- Indenting
-- o.expandtab = true
o.shiftwidth = 4
-- o.smartindent = true
o.tabstop = 4
o.softtabstop = 4

---INI CUMA TESTING DOANG----
vim.diagnostic.config {
    virtual_text = {
        -- Cuma tampilin satu error aja kalau ada banyak
        format = function(diagnostic)
            return string.format("%s", diagnostic.message)
        end,
    },
    -- Ini biar nggak double-double kalau ada linter lain
    update_in_insert = false,
}
-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
