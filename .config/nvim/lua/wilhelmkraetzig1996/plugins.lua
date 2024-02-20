local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

require("lazy").setup(
{
    'nvim-treesitter/nvim-treesitter',
    'navarasu/onedark.nvim',
    'nvim-telescope/telescope.nvim',
    'jvgrootveld/telescope-zoxide',
    'nvim-lua/plenary.nvim',
    'VonHeikemen/lsp-zero.nvim',
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
    'folke/todo-comments.nvim',
    'folke/twilight.nvim',
    'iamcco/markdown-preview.nvim',
    'lewis6991/gitsigns.nvim',
    'mg979/vim-visual-multi',
    'simrat39/symbols-outline.nvim',
    'vim-airline/vim-airline',
    'voldikss/vim-floaterm',
    'tpope/vim-commentary',
    'rmagatti/goto-preview',
    'andrewferrier/wrapping.nvim',
    -- autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/vim-vsnip',
    'hrsh7th/vim-vsnip-integ',
    'rafamadriz/friendly-snippets',
    'onsails/lspkind.nvim',
    'github/copilot.vim',
    -- debugging
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'mfussenegger/nvim-dap-python',
    {
        'w0rp/ale',
        config = function()
            vim.g.ale_fix_on_save = 1
            vim.g.ale_linters = {
                python = {'flake8', 'black'},
                c = {'clang', 'clangtidy'},
                cpp = {'clang', 'clangtidy'},
                bash = {'shellcheck'},
            }
            vim.g.ale_fixers = {
                python = {'black'},
                c = {'clang-format', 'clangtidy'},
                cpp = {'clang-format', 'clangtidy'},
                bash = {'shfmt'},
            }
            vim.g.ale_sign_error = '✗'
            vim.g.ale_sign_warning = '⚠'
            vim.g.ale_sign_info = 'ℹ'
            vim.g.ale_sign_style_error = '✗'
            vim.g.ale_sign_style_warning = '⚠'
            vim.g.ale_sign_style_info = 'ℹ'
            vim.g.ale_echo_msg_error_str = '✗'
            vim.g.ale_echo_msg_warning_str = '⚠'
            vim.g.ale_echo_msg_info_str = 'ℹ'
            vim.g.ale_echo_msg_format = '[%linter%] %s [%severity%]'
            vim.g.ale_lint_on_insert_leave = 1
            vim.g.ale_lint_on_insert = 0
            vim.g.ale_lint_on_text_changed = 'never'
            vim.g.ale_lint_on_enter = 0
            vim.g.ale_lint_on_filetype_changed = 0
            vim.g.ale_lint_on_save = 0
            vim.g.ale_lint_on_cursor_hold = 0
            vim.g.ale_lint_on_cursor_moved = 0
            vim.g.ale_lint_on_insert = 0
        end
    },
})
