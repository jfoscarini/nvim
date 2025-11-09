return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        default_component_configs = {
            filesystem = {
                use_libuv_file_watcher = true,
            },
            git_status = {
                symbols = {
                    added = "✚",
                    modified = "",
                    deleted = "✖",
                    renamed = "➜",
                    untracked = "★",
                    ignored = "◌",
                    unstaged = "",
                    staged = "✔",
                    conflict = "",
                },
            },
        },
    },
    config = function(_, opts)
        require("neo-tree").setup(opts)
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                require("neo-tree.command").execute({
                    source = "filesystem",
                    reveal = true,
                    position = "left",
                })
                vim.cmd("wincmd p")
            end,
        })
    end,
    lazy = false,
}
