local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

vim.lsp.config["bashls"] = {
    cmd = { "bash-language-server", "start" },
    filetypes = { "sh", "bash" },
    root_dir = function(fname)
        return vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true, path = fname })[1]) or vim.fn.getcwd()
    end,
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/inlayHint") then
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
    pattern = { "sh", "bash" },
    callback = function()
        vim.lsp.start(vim.lsp.config["bashls"])
    end,
})
