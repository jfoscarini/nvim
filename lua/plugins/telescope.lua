return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    config = function()
        require("telescope").setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })

        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>/a", builtin.live_grep, { desc = "[A]ll Project" })
        vim.keymap.set("n", "<leader>/b", builtin.buffers, { desc = "[B]uffers" })
        vim.keymap.set("n", "<leader>/d", builtin.lsp_definitions, { desc = "[D]efinitions" })
        vim.keymap.set("n", "<leader>/f", builtin.find_files, { desc = "[F]iles" })
        vim.keymap.set("n", "<leader>/g", function ()
            builtin.live_grep({
                grep_open_files = true,
                prompt_title = "Live Grep in Open Files",
            })
        end, { desc = "[G]rep" })
        vim.keymap.set("n", "<leader>/h", builtin.help_tags, { desc = "[H]elp" })
        vim.keymap.set("n", "<leader>/i", builtin.lsp_implementations, { desc = "[I]mplementations" })
        vim.keymap.set("n", "<leader>/k", builtin.keymaps, { desc = "[K]eymaps" })
        vim.keymap.set("n", "<leader>/r", builtin.lsp_references, { desc = "[R]eferences" })
        vim.keymap.set("n", "<leader>/t", builtin.diagnostics, { desc = "Diagnostics [T]rouble" })
        vim.keymap.set("n", "<leader>/.", builtin.oldfiles, { desc = "Recent Files" })
        vim.keymap.set("n", "<leader>//", function()
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end, { desc = "[/] Fuzzily in Buffer" })

    end
}
