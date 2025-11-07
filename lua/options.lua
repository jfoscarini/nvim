vim.o.confirm = true
vim.o.undofile = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.scrolloff = 10

vim.o.showmode = false
vim.o.number = true
vim.o.signcolumn = "yes"
vim.o.cursorline = true

vim.o.list = true
vim.opt.listchars = {
    tab = "┊ ",
    trail = "·",
    nbsp = "␣",
    extends = "⟩",
    precedes = "⟨"
}

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = "split"

vim.o.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.keymap.set('v', '<D-c>', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<D-c>', '"+yy', { noremap = true, silent = true })
vim.keymap.set('n', '<D-v>', '"+p', { noremap = true, silent = true })
vim.keymap.set('i', '<D-v>', '<C-r>+', { noremap = true, silent = true })
vim.keymap.set({'n', 'i'}, '<D-z>', '<Esc>u')
vim.keymap.set({'n', 'i'}, '<D-S-z>', '<Esc><C-r>')
