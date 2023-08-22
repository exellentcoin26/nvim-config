local lsp_config = require("plugins.configs.lspconfig")
local on_attach = lsp_config.on_attach
local capabilities = lsp_config.capabilities

local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        check = {
          command = "clippy",
        }
      }
    }
  },
}

return options
