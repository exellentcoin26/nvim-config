local merge_tables = require("custom.utils").merge_tables

local default = require("plugins.configs.mason")

local opts = {
  ensure_installed = {
    "black",
    "yapf",
    "pyright",
    "ruff",
    "rust-analyzer",
    "stylua",
  },
}

return merge_tables(default, opts)
