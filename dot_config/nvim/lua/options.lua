-- Load NvChad defaults
require "nvchad.options"

-- =========================================================
-- Cursor appearance & highlights
-- =========================================================

-- local o = vim.o
-- o.cursorlineopt = 'both' -- uncomment to enable full cursorline

-- Define a bright yellow highlight group for the cursor in insert mode
-- vim.api.nvim_set_hl(0, "CursorInsert", { fg = "black", bg = "yellow" })

-- Matching parentheses highlight
-- Dark theme:
-- vim.api.nvim_set_hl(0, "MatchParen", { bg = "#0e8c31", fg = "#090d0a", bold = true })
-- Light theme:
-- vim.api.nvim_set_hl(0, "MatchParen", { bg = "#0d9002", fg = "#f9fdfa", bold = true })

-- Cursor shape per mode
vim.opt.guicursor = {
  "n-v-c:block", -- block in normal/visual
  "i-ci-ve:ver25-CursorInsert-blinkwait175-blinkon150-blinkoff175", -- thin vertical bar in insert
  "r-cr:hor20",  -- horizontal bar in replace
  "o:hor50",
}

-- =========================================================
-- Line numbers
-- =========================================================

-- Hybrid mode: absolute on current line, relative elsewhere
vim.opt.number = true
vim.opt.relativenumber = true

-- =========================================================
-- Wrapping / text display
-- =========================================================

vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true

-- =========================================================
-- Filetype-specific settings
-- =========================================================

-- LaTeX: wrap text at 100 chars, keep nice wrapping
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.opt_local.textwidth = 100
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
  end,
})
