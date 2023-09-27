local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")
local lspconfig_util = require("lspconfig/util")
local mason = require("mason-lspconfig")

local lsp_options = {
  on_attach = on_attach,
  capabilities = capabilities,
}

local function dont_override (name)
  local server_list = {"lua_ls"}

  for _,v in ipairs(server_list) do
    if name == v then
      return true
    end
  end

  return false
end


-- setup all handlers registered in mason
-- https://github.com/williamboman/mason.nvim/discussions/77
mason.setup_handlers({
  function (server_name)
    if dont_override(server_name) then
      return
    end

    lspconfig[server_name].setup(lsp_options)
  end
})
