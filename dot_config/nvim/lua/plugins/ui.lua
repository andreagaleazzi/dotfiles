return {
  -- Distraction-free coding
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("zen-mode").setup {
        window = {
          backdrop = 1,
          width = 100,
          options = {
            number = true,
            relativenumber = false,
            cursorline = true,
          },
        },
        plugins = { twilight = { enabled = false } },
      }
    end,
  },
    -- Smooth scrolling
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("neoscroll").setup {
        -- You can tweak easing and mappings here
        easing_function = "cubic", -- "quadratic", "sine" etc
        hide_cursor = true,        -- hide cursor while scrolling
        stop_eof = true,           -- stop at <EOF>
      }
    end,
  },

  -- Cursor smear / trail effect
  {
    "sphamba/smear-cursor.nvim",
    event = "BufReadPost",
    opts = {
      smear_insert = true,  -- smear when entering insert mode
      smear_normal = true,  -- smear in normal mode motions
      length = 20,          -- trail length
    },
    config = function(_, opts)
      require("smear_cursor").setup(opts)
    end,
  },

  -- Preview line jumps (e.g. :42 shows line 42 before committing)
  {
    "nacro90/numb.nvim",
    event = "BufReadPost",
    config = function()
      require("numb").setup {
        show_numbers = true,      -- show line numbers while previewing
        show_cursorline = true,   -- highlight cursor line
      }
    end,
  },

  -- Flash.nvim: fast motions & search
  {
    "folke/flash.nvim",
    event = "VeryLazy", -- loads after startup
    opts = {
      modes = {
        char = { jump_labels = true },
      },
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    },
  },

  -- Symbols outline (functions/classes, toggle with :AerialToggle)
  {
    "stevearc/aerial.nvim",
    cmd = "AerialToggle",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    config = function()
      require("aerial").setup {
        backends = { "treesitter", "lsp", "markdown", "man" },
        layout = {
          max_width = { 40, 0.2 },
          width = nil,
          min_width = 20,
        },
        show_guides = true,
        filter_kind = false, -- show all symbols
      }
    end,
  },

  -- Highlight TODO, FIXME, etc. with pretty signs
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup {
        signs = true, -- show icons in the sign column
        keywords = {
          FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        },
      }
    end,
  },
}
