vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>", { desc = "Normal mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("v", "<D-c>", '"+y', { noremap = true, silent = true, desc = "Copy" })
vim.keymap.set("n", "<D-c>", '"+yy', { noremap = true, silent = true, desc = "Copy" })
vim.keymap.set("n", "<D-v>", '"+p', { noremap = true, silent = true, desc = "Paste" })
vim.keymap.set("i", "<D-v>", "<C-r>+", { noremap = true, silent = true, desc = "Paste" })

vim.keymap.set("n", "<D-a>", "ggVG", { desc = "Select all" })

vim.keymap.set("n", "<D-Left>", "0", { desc = "Start of line" })
vim.keymap.set("i", "<D-Left>", "<C-o>0", { desc = "Start of line" })
vim.keymap.set("n", "<D-Right>", "$", { desc = "End of line" })
vim.keymap.set("i", "<D-Right>", "<C-o>$", { desc = "End of line" })
vim.keymap.set("n", "<D-Up>", "gg", { desc = "First line" })
vim.keymap.set("i", "<D-Up>", "<C-o>gg", { desc = "First line" })
vim.keymap.set("n", "<D-Down>", "G", { desc = "Last line" })
vim.keymap.set("i", "<D-Down>", "<C-o>G", { desc = "Last line" })

vim.keymap.set({ "n", "i", "v" }, "<D-s>", "<cmd>update<CR>", { desc = "Save file" })
vim.keymap.set({ "n", "i" }, "<D-z>", "<Esc>u", { desc = "Undo" })
vim.keymap.set({ "n", "i" }, "<D-S-z>", "<Esc><C-r>", { desc = "Redo" })

vim.keymap.set("n", "<D-w>", function()
    local bufnr = vim.api.nvim_get_current_buf()
    if vim.bo[bufnr].buftype == "" then
        vim.cmd("bnext")
        vim.cmd("bdelete " .. bufnr)
    else
        vim.cmd("close")
    end
end, { desc = "Close buffer" })
