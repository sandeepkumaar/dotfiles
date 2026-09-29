local lsp_aliases = {
	["ts_ls"] = "TSC",
	["vtsls"] = "TSC",
	["lua_ls"] = "LUA",
	["gopls"] = "GO",
	["pyright"] = "PY",
	["rust_analyzer"] = "RUST",
}

-- coc's default suggest.completionItemKindLabels
local coc_kinds = {
	Text = "v",
	Method = "f",
	Function = "f",
	Constructor = "f",
	Field = "m",
	Variable = "v",
	Class = "C",
	Interface = "I",
	Module = "M",
	Property = "m",
	Unit = "U",
	Value = "v",
	Enum = "E",
	Keyword = "k",
	Snippet = "S",
	Color = "v",
	File = "F",
	Reference = "r",
	Folder = "F",
	EnumMember = "m",
	Constant = "v",
	Struct = "S",
	Event = "E",
	Operator = "O",
	TypeParameter = "T",
}

-- coc-style source shortcuts
local source_aliases = {
	buffer = "B",
	path = "F",
	snippets = "S",
}

return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = {
			keymap = {
				preset = "super-tab",
				-- Override Tab: Cycles the menu, expands snippets, completes after text, or indents
				["<Tab>"] = {
					"select_next",
					"snippet_forward",
					function(cmp)
						local cursor = vim.api.nvim_win_get_cursor(0)
						local before_cursor = vim.api.nvim_get_current_line():sub(1, cursor[2])
						if before_cursor:match("%S$") then
							return cmp.show()
						end
					end,
					"fallback",
				},
			},
			completion = {
				list = {
					selection = { preselect = false, auto_insert = true },
				},
				menu = {
					auto_show = false, -- Manual trigger only (per your preference)
					border = "padded",
					draw = {
						padding = 0,
						gap = 1,
						columns = { { "label" }, { "kind" }, { "shortcut" } },
						components = {
							label = { width = { fill = true, max = 60 } },
							kind = {
								text = function(ctx)
									return coc_kinds[ctx.kind] or ""
								end,
							},
							shortcut = {
								text = function(ctx)
									local name = ctx.item.client_name
									local alias = name and (lsp_aliases[name] or name:upper())
										or source_aliases[ctx.item.source_id]
										or ctx.source_name:upper()
									return "[" .. alias .. "]"
								end,
								highlight = "Comment",
							},
						},
					},
				},

				documentation = {
					window = { border = "padded" },
				},
			},
			fuzzy = { implementation = "lua" },
			cmdline = {
				enabled = false,
			},
		},
	},
}
