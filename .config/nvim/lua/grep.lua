-- [[ Grep ]]
--  Uses ripgrep via the grepprg setting

-- Grep word under cursor
vim.keymap.set('n', 'gs', function()
  local word = vim.fn.expand('<cword>')
  vim.cmd('silent grep! ' .. vim.fn.shellescape(word))
  vim.cmd('copen')
end, { desc = 'Grep word under cursor' })

-- :Grep command
vim.api.nvim_create_user_command('Grep', function(opts)
  if #opts.fargs == 0 then
    vim.cmd('copen')
  else
    vim.cmd('silent grep! ' .. table.concat(opts.fargs, ' '))
    vim.cmd('copen')
  end
end, { nargs = '*', complete = 'file', desc = 'Grep via ripgrep' })

-- Make :grep redirect to :Grep when typed at the start of the command line
vim.cmd([[cnoreabbrev <expr> grep (getcmdtype() ==# ':' && getcmdline() =~# '^grep') ? 'Grep' : 'grep']])
