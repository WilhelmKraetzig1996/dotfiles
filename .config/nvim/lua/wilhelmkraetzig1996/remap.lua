vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("t", "<A-h>", "<C-\\><C-N><C-w>h", {remap = false})
vim.keymap.set("t", "<A-j>", "<C-\\><C-N><C-w>j", {remap = false})
vim.keymap.set("t", "<A-k>", "<C-\\><C-N><C-w>k", {remap = false})
vim.keymap.set("t", "<A-l>", "<C-\\><C-N><C-w>l", {remap = false})
vim.keymap.set("i", "<A-h>", "<C-\\><C-N><C-w>h", {remap = false})
vim.keymap.set("i", "<A-j>", "<C-\\><C-N><C-w>j", {remap = false})
vim.keymap.set("i", "<A-k>", "<C-\\><C-N><C-w>k", {remap = false})
vim.keymap.set("i", "<A-l>", "<C-\\><C-N><C-w>l", {remap = false})
vim.keymap.set("n", "<A-h>", "<C-w>h", {remap = false})
vim.keymap.set("n", "<A-j>", "<C-w>j", {remap = false})
vim.keymap.set("n", "<A-k>", "<C-w>k", {remap = false})
vim.keymap.set("n", "<A-l>", "<C-w>l", {remap = false})
