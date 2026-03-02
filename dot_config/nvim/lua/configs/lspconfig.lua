local nvlsp = require "nvchad.configs.lspconfig"

-- read :h vim.lsp.config for changing options of lsp servers 

-- Load NvChad defaults (recommended)
nvlsp.defaults()

-- Configure basedpyright
vim.lsp.config.basedpyright = {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    basedpyright = {
      typeCheckingMode = "basic",
      reportMissingImports = false,
      reportMissingTypeStubs = false,
      reportUnknownVariableType = "none",
      reportUnknownMemberType = "none",
    },
  },
}

-- List of LSP servers you want enabled
local servers = {
  "basedpyright",      -- Python
  "ruff",              -- Python linter (via LSP)
  "json-lsp",          -- JSON
  "lua-language-server", -- Lua (nvim config)
  "eslint-lsp",        -- JS/TS
  "fish-lsp",          -- Fish shell
  "html",
  "cssls",
  "taplo",             -- TOML
}

vim.lsp.enable(servers)
