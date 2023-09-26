vim.o.background = "light"

function toggleBackgroundColor()
    if vim.o.background == "light" then
        vim.o.background = "dark"
    else
        vim.o.background = "light"
    end
end

vim.keymap.set("n", "<F12>",  toggleBackgroundColor)
