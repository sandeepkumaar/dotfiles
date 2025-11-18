vim.opt.guicursor = 'n-v-c:block,i:block'
vim.g.termguicolors=true
vim.cmd 'colorscheme pablo'
vim.cmd [[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
]]

-- Set leader key (if not already set)
vim.g.mapleader = ' '

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

--vim.g.netrw_fastbrowse = 0
--vim.g.netrw_list_hide = '.*'

-- Paste multiple times in visual mode
vim.api.nvim_set_keymap('x', 'p', 'pgvy', opts)
vim.api.nvim_create_user_command('E', 'Explore', {}) --infavour of vscode

--- VSCode-specific keymaps
if vim.g.vscode then
  -- Window switch: <leader>ww (focus next editor group)
  keymap('n', '<leader>ww', '<cmd>lua require("vscode").action("workbench.action.focusNextGroup")<CR>', opts)

  -- Alternate buffer: <leader>b (open previous editor)
  keymap('n', '<leader>b', '<cmd>lua require("vscode").action("workbench.action.openPreviousRecentlyUsedEditorInGroup")<CR>', opts)

  -- Open terminal: <leader>z
  keymap('n', '<leader>z', '<cmd>lua require("vscode").action("workbench.action.terminal.toggleTerminal")<CR>', opts)

  -- Save file: <leader>s
  keymap('n', '<leader>w', '<cmd>lua require("vscode").action("workbench.action.files.save")<CR>', opts)
  -- Save file from insert mode with Ctrl + s
  keymap('i', '<C-s>', '<Esc><cmd>lua require("vscode").action("workbench.action.files.save")<CR>', opts)

  -- Close a file: <leader>q
  keymap('n', '<leader>q', '<cmd>lua require("vscode").action("workbench.action.closeActiveEditor")<CR>', opts)

  -- Open file explorer (netrw): <leader>x to close use cmd+b
  keymap('n', '<leader>x', '<cmd>lua require("vscode").action("workbench.files.action.focusFilesExplorer")<CR>', opts)
  -- Open Quick Open (Ctrl+P): <leader>f
  keymap('n', '<leader>f', '<cmd>lua require("vscode").action("workbench.action.quickOpen")<CR>', opts)

  -- Open command line with :Edit ready: <leader>e
  keymap('n', '<leader>e', ':Edit ', { noremap = true, silent = false })

  -- use cmd+L to go to cascase, comeback with cmd+1 
end


