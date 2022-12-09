local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
    return
end

local status_ok, mason_nvim_dap = pcall(require, "mason-nvim-dap")
if not status_ok then
    return
end

mason.setup()
mason_lspconfig.setup()
mason_nvim_dap.setup({
    automatic_setup = true,
})
mason_nvim_dap.setup_handlers({
    function(source_name)
        -- all sources with no handler get passed here


        -- Keep original functionality of `automatic_setup = true`
        require("mason-nvim-dap.automatic_setup")(source_name)
    end,
})
