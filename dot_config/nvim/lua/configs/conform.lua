local options = {
  formatters_by_ft = {
    -- Python
    python = { "black" },

    -- Lua
    lua = { "stylua" },

    -- Web stack
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    vue = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    html = { "prettier" },

    -- Data / markup
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },

    -- Shell
    sh = { "shfmt" },

    -- C / C++
    c = { "clang-format" },
    cpp = { "clang-format" },

    -- Go
    go = { "gofmt" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
