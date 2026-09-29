-- Native vim.diagnostic config for LSP (matching coc-settings.json)

vim.opt.signcolumn = 'number'
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE', ctermbg = 'NONE' })

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '>>',
      [vim.diagnostic.severity.WARN] = '--',
      [vim.diagnostic.severity.INFO] = '--',
      [vim.diagnostic.severity.HINT] = '--',
    },
  },
  underline = false,
  virtual_text = false,
  float = false,
  update_in_insert = false,
  severity_sort = true,
})

-- Echo current line diagnostics on CursorMoved (matching coc's checkCurrentLine: true)
local diagnostic_group = vim.api.nvim_create_augroup('DiagnosticEcho', { clear = true })
vim.api.nvim_create_autocmd('CursorMoved', {
  group = diagnostic_group,
  callback = function()
    local diags = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
    if #diags > 0 then
      local msg = diags[1].message
      -- Get first line only, truncate if too long
      msg = msg:match('[^\n]*')
      local max_len = vim.o.columns - 20
      if #msg > max_len then
        msg = msg:sub(1, max_len - 3) .. '...'
      end
      vim.cmd('echo "' .. msg:gsub('"', '\\"') .. '"')
    else
      vim.cmd('echo ""')
    end
  end,
})
