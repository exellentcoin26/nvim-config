local plugins = {
  -- lsp and completion
  {
    "williamboman/mason.nvim",
    opts = function()
      return require("custom.configs.mason")
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end
  },
  {
    "williamboman/mason-lspconfig.nvim"
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function ()
      local M = require("plugins.configs.cmp")
      table.insert(M.sources, {name = "crates"})
      return M
    end

  },

  -- formatting and linting
  {
    "nvimdev/guard.nvim",
    -- Builtin configuration, optional
    dependencies = {
        "nvimdev/guard-collection",
    },
    lazy = false,
    config = function ()
      require("custom.configs.guard")
    end
  },

  -- debugging
  {
    "mfussenegger/nvim-dap",
  },

  -- rust
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require("custom.configs.rust")
    end,
    config = function (_, opts)
      require("rust-tools").setup(opts)
    end
  },
  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function (_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end
  },
}

return plugins
