vim.keymap.set("v", "<D-c>", '"+y', { noremap = true, silent = true, desc = "Copy" })
vim.keymap.set("n", "<D-c>", '"+yy', { noremap = true, silent = true, desc = "Copy" })
vim.keymap.set("n", "<D-v>", '"+p', { noremap = true, silent = true, desc = "Paste" })
vim.keymap.set("i", "<D-v>", "<C-r>+", { noremap = true, silent = true, desc = "Paste" })

vim.keymap.set("n", "<D-a>", "ggVG", { desc = "Select all" })
