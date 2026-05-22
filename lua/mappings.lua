-- Tetep require mappings bawaan NvChad biar gak ilang buff-nya
require "nvchad.mappings"

local M = {}

-- 1. Mapping yang pake format Tabel NvChad
M.general = {
  i = {
    -- Fix buat Backspace dan Enter biar gak double trigger
    ["<BS>"] = { "<BS>", "fix backspace" },
    ["<CR>"] = { "<CR>", "fix enter" },
    
    -- Shortcut jk buat Escape (cara NvChad)
    ["jk"] = { "<ESC>", "escape insert mode" },
  },
  
  n = {
    -- CMD enter command mode
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

-- 2. Mapping yang pake vim.keymap.set (Gaya standar)
-- Kamu bisa taruh di sini SEBELUM return
local map = vim.keymap.set

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- RITUAL TERAKHIR: Return M harus SELALU di baris paling bawah!
return M
