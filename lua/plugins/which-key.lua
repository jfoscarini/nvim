return {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
        spec = {
            { "<leader><leader>", hidden = true },
            { "<leader>/", group = "[/] Search"},
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        vim.keymap.set("n", "<leader><leader>", function()
            wk.show("<leader>", { mode = "n" })
        end, { silent = true })
    end,
}
