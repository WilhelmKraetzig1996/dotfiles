vim.keymap.set('n', '<leader>tt', '<cmd>NvimTreeToggle<cr>', { desc = '[T]oggle [T]ree' })
require('nvim-tree').setup({
    view = {
        relativenumber = true
    },
})
vim.keymap.set('n', "<C-C>", require'nvim-tree.api'.tree.change_root_to_node)
