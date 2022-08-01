local rm_trailing_white_space = vim.api.nvim_create_augroup("no_trailing_white_space", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "remove trailing white space",
	command = "%s/\\s\\+$//e",
	group = rm_trailing_white_space,
})

-- define filter for non format clients
local function filter(client)
	local non_format = { "sumneko_lua", "tsserver" }
	local should_format = true
	for _, entry in ipairs(non_format) do
		should_format = not (entry == client.name)
	end
	return should_format
end

local format_on_save = vim.api.nvim_create_augroup("format_on_save", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "format on save if possible",
	command = "lua vim.lsp.buf.formatting_sync()",
	group = format_on_save,
})
