require('config.remap')
require('config.set')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup(
    {
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.8',
            dependencies = { 'nvim-lua/plenary.nvim' }
        },
        {
            'AlexvZyl/nordic.nvim',
            lazy = false,
            priority = 1000,
            config = function()
                require 'nordic'.load()
            end
        },
        {
            "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"
        },
        {
            "mbbill/undotree"
        },
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            dependencies = {
                { 'neovim/nvim-lspconfig' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'hrsh7th/nvim-cmp' },
                { 'L3MON4D3/LuaSnip' },

                { 'williamboman/mason.nvim' },
                { 'williamboman/mason-lspconfig.nvim' },
            }
        },
        {
            "m4xshen/autoclose.nvim"
        },
        {
            "windwp/nvim-ts-autotag"
        },
        {
            "nvim-neotest/neotest",
            dependencies = {
                "nvim-neotest/nvim-nio",
                "nvim-lua/plenary.nvim",
                "nvim-treesitter/nvim-treesitter",
                "antoinemadec/FixCursorHold.nvim",
                "marilari88/neotest-vitest"
            }
        },
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim",
            }
        },
        {
            'romgrk/barbar.nvim',
            dependencies = {
                'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
                'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
            },
            init = function() vim.g.barbar_auto_setup = false end,
            version = '^1.0.0', -- optional: only update when a new 1.x version is released
        },
        {
            'jose-elias-alvarez/null-ls.nvim'
        }
    })
