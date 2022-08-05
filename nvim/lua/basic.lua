-- Sets basic options for Neovim
local set = vim.opt

-- Set leader to space
vim.g.mapleader = ' '

-- Tabs
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

-- Searching config
set.ignorecase = true
set.smartcase = true

-- Completeopt
set.completeopt = 'menu,menuone,noselect'

-- Line numbers
set.number = true
