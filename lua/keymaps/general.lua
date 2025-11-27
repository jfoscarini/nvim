vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>", { desc = "Normal mode" })

vim.keymap.set({ "n", "i", "v" }, "<D-s>", "<cmd>update<CR>", { desc = "Save file" })
vim.keymap.set({ "n", "i" }, "<D-z>", "<Esc>u", { desc = "Undo" })
vim.keymap.set({ "n", "i" }, "<D-S-z>", "<Esc><C-r>", { desc = "Redo" })

vim.keymap.set("n", "<D-t>", "<cmd>enew<CR>", { desc = "New Buffer" })
vim.keymap.set("n", "<D-w>", function()
	local bufnr = vim.api.nvim_get_current_buf()
	if vim.bo[bufnr].buftype == "" then
		vim.cmd("bnext")
		vim.cmd("bdelete " .. bufnr)
	else
		vim.cmd("close")
	end
end, { desc = "Close buffer" })
