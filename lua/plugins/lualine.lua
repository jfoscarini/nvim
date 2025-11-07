return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "auto",
			component_separators = "",
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = {
				{ "mode", separator = { left = "", right = "" }, right_padding = 2 },
			},
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "%=", "buffers" },
			lualine_x = {},
			lualine_y = { "filetype", "fileformat", "encoding" },
			lualine_z = {
				{ "progress" },
				{ "location", separator = { right = "" }, left_padding = 2 },
			},
		},
		tabline = {},
		extensions = {},
	},
	config = function(_, opts)
		require("lualine").setup(opts)
	end,
}
