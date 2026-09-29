local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

--  Use CTRL+<hjkl> to switch between windows
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Paste without losing register in visual mode
keymap('x', 'p', 'pgvy', opts)

-- Window toggle
keymap('n', '<leader>ww', '<C-w>w', opts)

-- Alternate buffer
keymap('n', '<leader>-', '<C-^>', opts)

-- Suspend to terminal
--keymap('n', '<leader>z', '<C-z>', opts)

-- Save
keymap('n', '<leader>w', '<cmd>w<CR>', opts)

-- Quit
keymap('n', '<leader>q', '<cmd>q<CR>', opts)

-- Explorer
vim.api.nvim_create_user_command('E', 'Explore', {})
keymap('n', '<leader>e', '<cmd>Ex<CR>', opts)

-- Vertical split
--keymap('n', '<leader>vs', '<cmd>vs<CR>', opts)

-- Save from insert mode
--keymap('i', '<C-s>', '<Esc><cmd>w<CR>', opts)

