vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>", { desc = "Normal mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<D-w>", function()
    local bufnr = vim.api.nvim_get_current_buf()
    if vim.bo[bufnr].buftype == "" then
        vim.cmd("bnext")
        vim.cmd("bdelete " .. bufnr)
    else
        vim.cmd("close")
    end
end, { desc = "Close the current buffer" })
