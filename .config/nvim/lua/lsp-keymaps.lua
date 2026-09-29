local M = {}

function M.setup(bufnr)
  local keymap = vim.keymap.set
  local opts = function(desc)
    return { buffer = bufnr, noremap = true, silent = true, desc = desc }
  end

  -- GoTo navigation
  keymap('n', 'gd', vim.lsp.buf.definition, opts('Goto definition'))
  keymap('n', 'gy', vim.lsp.buf.type_definition, opts('Goto type definition'))
  keymap('n', 'gi', vim.lsp.buf.implementation, opts('Goto implementation'))
  keymap('n', 'gr', function()
    vim.lsp.buf.references({ includeDeclaration = false })
  end, opts('Goto references'))

  -- Hover & Documentation
  local function show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
      vim.api.nvim_command('h ' .. cw)
    else
      vim.lsp.buf.hover()
    end
  end
  keymap('n', 'K', show_docs, opts('Show documentation'))

  -- Diagnostics navigation & display
  keymap('n', '[g', vim.diagnostic.goto_prev, opts('Previous diagnostic'))
  keymap('n', ']g', vim.diagnostic.goto_next, opts('Next diagnostic'))
  keymap('n', 'T', vim.diagnostic.open_float, opts('Show diagnostic in float'))

  -- Yank diagnostic message
  local function copy_diagnostic_message()
    local bufnr = vim.api.nvim_get_current_buf()
    local lnum = vim.api.nvim_win_get_cursor(0)[1]
    local diags = vim.diagnostic.get(bufnr, { lnum = lnum - 1 })
    if #diags == 0 then
      vim.notify('No diagnostic on this line', vim.log.levels.WARN)
      return
    end
    local messages = {}
    for _, diag in ipairs(diags) do
      table.insert(messages, diag.message)
    end
    local text = table.concat(messages, '\n')
    vim.fn.setreg('"', text)
    vim.fn.setreg('+', text)
    vim.notify('Copied diagnostic message to clipboard')
  end
  keymap('n', 'yre', copy_diagnostic_message, opts('Yank diagnostic message'))

  -- Code actions & refactoring
  keymap('n', '<leader>a', vim.lsp.buf.code_action, opts('Code actions'))
  keymap('x', '<leader>a', vim.lsp.buf.code_action, opts('Code actions'))
  keymap('n', '<leader>ac', vim.lsp.buf.code_action, opts('Code actions (cursor)'))
  keymap('n', '<leader>as', vim.lsp.buf.code_action, opts('Code actions (source)'))
  keymap('n', '<leader>qf', function()
    vim.lsp.buf.code_action({ context = { only = { 'quickfix' } } })
  end, opts('Quick fix'))
  keymap('n', '<leader>re', vim.lsp.buf.code_action, opts('Refactor'))
  keymap('x', '<leader>r', vim.lsp.buf.code_action, opts('Refactor selection'))
  keymap('n', '<leader>r', vim.lsp.buf.code_action, opts('Refactor selection'))

  -- Rename
  keymap('n', '<leader>rn', vim.lsp.buf.rename, opts('Rename symbol'))

  -- Format (using :Format command or neoformat)
  keymap('n', '<leader>f', function()
    vim.cmd('Neoformat')
  end, opts('Format'))
  keymap('x', '<leader>f', function()
    vim.cmd('Neoformat')
  end, opts('Format selection'))
end

return M
