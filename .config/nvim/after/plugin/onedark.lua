-- vim.o.background = "light"

function toggleBackgroundColor()
    if vim.o.background == "light" then
        vim.o.background = "dark"
    else
        vim.o.background = "light"
    end
end

vim.keymap.set("n", "<F12>",  toggleBackgroundColor)
vim.api.nvim_create_autocmd({"Signal", }, {
    pattern = "*",
    callback = toggleBackgroundColor,
})
