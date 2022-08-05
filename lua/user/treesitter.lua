local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter.setup({
	-- list of parser names
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"comment",
		"cpp",
		"css",
		"cuda",
		"dockerfile",
		"go",
		"graphql",
		"html",
		"java",
		"javascript",
		"json",
		"latex",
		"llvm",
		"lua",
		"make",
		"markdown",
		"prisma",
		"regex",
		"rust",
		"sql",
		"svelte",
		"toml",
		"tsx",
		"typescript",
		"yaml",
		"vue",
	},

	-- automatically install parsers when entering buffer
	auto_install = true,

	highlight = {
		-- disable the whole extension with `false`
		enable = true,

		-- disable normal vim highlighting
		additional_vim_regex_highlighting = false,
	},
})
