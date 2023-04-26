-- Set lualine as statusline, see `:help lualine.txt`
require("lualine").setup({
	options = {
		icons_enabled = false,
		component_separators = "|",
		section_separators = "",
	},
	-- sections = {
	-- 	lualine_a = { "filename" },
	-- 	lualine_b = { "filetype" },
	-- 	lualine_c = {},
	--
	-- 	lualine_x = { "progress" },
	-- 	lualine_y = { "location" },
	-- 	lualine_z = { "searchcount" },
	-- },
})
