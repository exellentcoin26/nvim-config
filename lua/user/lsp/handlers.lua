local M = {}

-- highligh local variable/function/keyword when holding cursor
local function lsp_highlight_document(client)
	if client.resolved_capabilities.document_highlight then
		local lsp_document_highlight_ag = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
		vim.api.nvim_create_autocmd("CursorHold", {
			desc = "highlight current function/keyword when holding cursor",
			pattern = "<buffer>",
			command = "lua vim.lsp.buf.document_highlight()",
			group = lsp_document_highlight_ag,
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			desc = "remove all highlights from current buffer when moving cursor",
			pattern = "<buffer>",
			command = "lua vim.lsp.buf.clear_references()",
			group = lsp_document_highlight_ag,
		})
	end
end

-- define lsp keymaps on start of lsp server
local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting_sync()' ]])
end

-- define on_attach function
M.on_attach = function(client, bufnr)
	-- filter servers we do not want to use for formatting
	if client.name == "sumneko_lua" then
		client.server_capabilities.document_formatting = false -- 0.7 and earlier
		client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
		client.server_capabilities.documentRangeFormattingProvider = false
	end

	if client.name == "tsserver" then
		client.server_capabilities.document_formatting = false -- 0.7 and earlier
		client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
		client.server_capabilities.documentRangeFormattingProvider = false
	end

	-- start lsp specific keymaps
	lsp_keymaps(bufnr)

	-- start daemon for highlighting of tokens in the document on `CursorHold`
	lsp_highlight_document(client)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

-- define client capabilities
M.capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

local status_ok = false

return M
