local lspconfig = package.loaded["lspconfig"]

local ignore_install = {}

local function table_contains(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

local all_server = {}
for _, s in ipairs(lspconfig.servers) do
    if not table_contains(ignore_install, s) then
        table.insert(all_server, s)
    end
end

require("mason-lspconfig").setup {
    ensure_installed = all_server,
    automatic_installation = false,
}
