local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

vim.lsp.config["clangd"] = {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--clang-tidy-checks=performance-*,bugprone-*,modernize-*,readability-*,clang-analyzer-*",
        "--completion-style=detailed",
        "--header-insertion=never",
        "--suggest-missing-includes",
        "--cross-file-rename",
    },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_markers = { "CMakeLists.txt", "compile_commands.json", ".git" },
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
    pattern = { "c", "cpp", "objc", "objcpp" },
    callback = function()
        vim.lsp.start(vim.lsp.config["clangd"])
    end,
})
