if vim.g.vscode then
    return
end

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("options")
require("keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    {
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "isort",
                "black",
            },
        },
        config = function(_, opts)
            local mason = require("mason")
            local mason_registry = require("mason-registry")
            mason.setup(opts)

            if mason_registry.refresh then
                mason_registry.refresh(function()
                    require("lsp.bash")
                    require("lsp.clangd")
                    require("lsp.pyright")
                    require("lsp.rust-analyzer")
                    require("lsp.ts")
                end)
            end
        end,
    },
    { import = "plugins" },
})
