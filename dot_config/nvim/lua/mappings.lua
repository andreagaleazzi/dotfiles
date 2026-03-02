-- Load NvChad defaults first
require "nvchad.mappings"

local map = vim.keymap.set

-- =========================================================
-- General Quality-of-life Mappings
-- =========================================================

-- Remap ; to enter command mode
-- map("n", ";", ":", { desc = "CMD enter command mode" })

-- Write with Ctrl-s
-- map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>")

-- jk escapes insert
map("i", "jk", "<Esc>", { noremap = true })

-- Esc escapes terminal (currently using <leader><Esc>)
map("t", "<LEADER><Esc>", "<C-\\><C-n>", { noremap = true })

-- Esc disabled in insert
map("i", "<ESC>", "<NOP>", { noremap = true })

-- j/k move by visual lines, unless count given
map("n", "j", function()
  return vim.v.count == 0 and "gj" or "j"
end, { expr = true, noremap = true, silent = true })

map("n", "k", function()
  return vim.v.count == 0 and "gk" or "k"
end, { expr = true, noremap = true, silent = true })

-- =========================================================
-- Debugging (nvim-dap + dap-ui)
-- =========================================================
local dap = require("dap")
local dapui = require("dapui")

-- Debug control
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Continue/Start" })
vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "Debug: Step Over (Next)" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Debug: Step Out" })

-- Breakpoints
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: Conditional Breakpoint" })

-- UI
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Debug: Open REPL" })
