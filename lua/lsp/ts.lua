local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

vim.lsp.config["ts_ls"] = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
    },
    root_markers = {
        "package.json",
        "tsconfig.json",
        "tsconfig.app.json",
        "jsconfig.json",
        ".git",
    },
    init_options = {
        hostInfo = "neovim",
    },
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        if client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end

        vim.diagnostic.config({
            virtual_text = { prefix = "●" },
            update_in_insert = false,
            float = { border = "rounded" },
            severity_sort = true,
        })
    end,
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
    callback = function()
        vim.lsp.start(vim.lsp.config["ts_ls"])
    end,
})
