-- Key mapping configuration
local map = vim.api.nvim_set_keymap
local bufopts = { noremap=true, silent=true }

-- Escape to clear highlighting
map('n', '<esc>', ':noh<cr>', bufopts)
-- Splits
map('n', '<leader>we', ':vsplit<cr><C-w>l', bufopts)
map('n', '<leader>wo', ':split<cr><C-w>j', bufopts)
-- Source vim config file
map('n', '<leader>vs', ':source ~/.config/nvim/init.lua', bufopts)
-- Buffers
map('n', '<leader>bd', ':bd<CR>', bufopts)
map('n', '<leader>bn', ':bn<CR>', bufopts)
map('n', '<leader>bp', ':bp<CR>', bufopts)

