local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
	return
end

local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
	return
end

-- icons for completion types (from https://www.nerdfonts.com/cheat-sheet)
local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end),
		["<s-tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" }, -- order of fields for completion entry
		format = function(entry, vim_item)
			-- select entry icon
			-- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			-- append source name (from https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources)
			vim_item.menu = ({
				luasnip = "[snippet]",
				buffer = "[buffer]",
				path = "[path]",
				cmp_tabnine = "[tabnine]",
				crates = "[crates.io]",
				npm = "[npmjs]",
				emoji = "",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "cmp_tabnine" },
		{ name = "crates" },
		{ name = "npm" },
		{ name = "emoji", option = { insert = true } },
	}),
	window = {
		documentation = cmp.config.window.bordered(),
	},
})
