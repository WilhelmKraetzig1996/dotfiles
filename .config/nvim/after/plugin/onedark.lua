function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

if file_exists(os.getenv("HOME") .. "/.scripts/toggle_dark_light/dark_mode_active") then
-- if file_exists("/home/dear/.scripts/toggle_dark_light/dark_mode_active") then
    -- vim.o.background = "dark"
    require('onedark').setup {
        colors = {
            bg0 = "#222d32",
            bg1 = "#29313B",
            bg2 = "#393f4a",
            bg3 = "#475156",
            bg_d = "#29353b",
            fg = "#c6d0d3",
        },
    }
else
    -- vim.o.background = light"
    require('onedark').setup {
        colors = {
            bg0 = "#fafafa",
            bg1 = "#f0f0f0",
            bg2 = "#e6e6e6",
            bg3 = "#dcdcdc",
            bg_d = "#c9c9c9",
            fg = "#383a42",
        },
    }
end

require('onedark').load()

function toggleBackgroundColor()
    if vim.o.background == "light" then
        vim.o.background = "dark"
        require('onedark').setup {
            colors = {
                bg0 = "#222d32",
                bg1 = "#29313B",
                bg2 = "#393f4a",
                bg3 = "#475156",
                bg_d = "#29353b",
                fg = "#c6d0d3",
            },
        }
    else
        vim.o.background = "light"
        require('onedark').setup {
            colors = {
                bg0 = "#fafafa",
                bg1 = "#f0f0f0",
                bg2 = "#e6e6e6",
                bg3 = "#dcdcdc",
                bg_d = "#c9c9c9",
                fg = "#383a42",
            },
        }
    end
    require('onedark').load()
end

vim.keymap.set("n", "<F12>",  toggleBackgroundColor)
vim.api.nvim_create_autocmd({"Signal", }, {
    pattern = "*",
    callback = toggleBackgroundColor,
})
