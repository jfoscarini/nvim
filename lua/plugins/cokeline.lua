return {
	"willothy/nvim-cokeline",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"stevearc/resession.nvim",
	},
	opts = {
		sidebar = {
			filetype = { "neo-tree" },
			components = {
				{
					text = function(buf)
						return ""
					end,
				},
			},
		},
	},
	config = true,
}
