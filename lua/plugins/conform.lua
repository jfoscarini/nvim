return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		notify_on_error = false,
		formatters_by_ft = {
			cpp = { "clang-format" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			json = { "prettierd", "prettier", stop_after_first = true },
			lua = { "stylua" },
			python = { "isort", "black" },
			typescript = { "prettierd", "prettier", stop_after_first = true },
		},
	},
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			desc = "[F]ormat buffer",
		},
	},
}
