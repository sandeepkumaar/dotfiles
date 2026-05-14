vim.opt.guicursor = 'n-v-c:block,i:block'
vim.o.termguicolors = false

vim.opt.splitright = true
vim.opt.path:append('**')
vim.opt.wildoptions:remove('pum')
vim.opt.wildignore:append('**/node_modules/**')

vim.opt.wrap = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.copyindent = true
vim.opt.preserveindent = true
--vim.cmd('filetype plugin indent on')
--vim.opt.statusline:prepend('%{coc#status()}')

vim.cmd 'colorscheme og'
vim.cmd [[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
]]

require('custom.coc')
require('custom.ale')

-- Set leader key (if not already set)
vim.g.mapleader = ' '

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

--vim.g.netrw_fastbrowse = 0
--vim.g.netrw_list_hide = '.*'
vim.g.netrw_liststyle = 0
vim.g.netrw_banner = 0


-- Paste multiple times in visual mode
vim.api.nvim_set_keymap('x', 'p', 'pgvy', opts)
vim.api.nvim_create_user_command('E', 'Explore', {}) --infavour of vscode

--- Neovim keymaps (equivalent to .vimrc)
-- Window switch: <leader>ww
keymap('n', '<leader>ww', '<C-w>w', opts)

-- Alternate buffer: <leader>-
keymap('n', '<leader>-', '<C-^>', opts)

-- Switch to terminal: <leader>z
keymap('n', '<leader>z', '<C-z>', opts)

-- Write file: <leader>w
keymap('n', '<leader>w', '<cmd>w<CR>', opts)

-- Quit file: <leader>q
keymap('n', '<leader>q', '<cmd>q<CR>', opts)

-- Explorer: <leader>e
keymap('n', '<leader>e', '<cmd>Ex<CR>', opts)

-- Split: <leader>vs
keymap('n', '<leader>vs', '<cmd>vs<CR>', opts)

-- Insert mode: Ctrl + s to save and return to normal mode
keymap('i', '<C-s>', '<Esc><cmd>w<CR>', opts)

-- File navigation
keymap('n', 'gF', '<cmd>vertical wincmd f<CR>', opts)


