if vim.fn.has('win32') == 1 then 
    vim.g.floaterm_shell = 'powershell'
end
vim.cmd('FloatermNew --name=lazygit lazygit')
vim.cmd('FloatermNew --name=shell')
vim.cmd('FloatermHide')
vim.keymap.set('n', '<F9>', '<C-c><cmd>FloatermShow lazygit<cr>', { noremap = true, silent = true })
vim.keymap.set('i', '<F9>', '<C-c><ESC><cmd>FloatermShow lazygit<cr>', { noremap = true, silent = true })
vim.keymap.set('t', '<F9>', '<C-\\><C-N><cmd>FloatermHide<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<F10>', '<C-c><cmd>FloatermShow shell<cr>', { noremap = true, silent = true })
vim.keymap.set('i', '<F10>', '<C-c><ESC><cmd>FloatermShow shell<cr>', { noremap = true, silent = true })
vim.keymap.set('t', '<F10>', '<C-\\><C-N><cmd>FloatermHide<cr>', { noremap = true, silent = true })
vim.g.floaterm_autoclose = 2
