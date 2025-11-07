return {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
        spec = {
            { "<leader>/", group = "[/] Search"},
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        vim.keymap.set("n", "<leader>", "<cmd>WhichKey<CR>", { desc = "<leader>" })
    end,
}
