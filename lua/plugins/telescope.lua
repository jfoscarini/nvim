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
        vim.keymap.set("n", "<leader>/a", builtin.live_grep, { desc = "Search in [A]ll Project" })
        vim.keymap.set("n", "<leader>/b", builtin.buffers, { desc = "Search in Existing [B]uffers" })
        vim.keymap.set("n", "<leader>/d", builtin.diagnostics, { desc = "Search [D]iagnostics" })
        vim.keymap.set("n", "<leader>/f", builtin.find_files, { desc = "Search [F]iles" })
        vim.keymap.set("n", "<leader>/g", function ()
            builtin.live_grep({
                grep_open_files = true,
                prompt_title = "Live Grep in Open Files",
            })
        end, { desc = "Search by [G]rep" })
        vim.keymap.set("n", "<leader>/h", builtin.help_tags, { desc = "Search [H]elp" })
        vim.keymap.set("n", "<leader>/k", builtin.keymaps, { desc = "Search [K]eymaps" })
        vim.keymap.set("n", "<leader>/.", builtin.oldfiles, { desc = "Search Recent Files [. repeat]" })
        vim.keymap.set("n", "<leader>//", function()
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end, { desc = "[/] Fuzzily Search in Current Buffer" })
    end
}
