-- load the lsp server installer
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

lsp_installer.setup({
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

-- setup lsp-config settings
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- define signs for errors and warnings
local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

-- set signs inside vim
for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- config nvim diagnostics
vim.diagnostic.config({
	virtual_text = false,
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

local opts = {
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
}

-- because `lsp_installer.on_server_ready()` is deprecated 😠
for _, server in ipairs(lsp_installer.get_installed_servers()) do
	if server.name == "sumneko_lua" then
		lspconfig["sumneko_lua"].setup({
			on_attach = opts.on_attach,
			-- capabilities = opts.capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
	else
		lspconfig[server.name].setup({
			on_attach = opts.on_attach,
			capabilities = opts.capabilities,
		})
	end
end
