-- Native vim.diagnostic config, kept separate from any single plugin
-- (coc.nvim manages its own diagnostics UI and does not go through this).

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
})

-- ALE-style: echo the current line's diagnostic in the cmdline instead of a float.
local hl_by_severity = {
  [vim.diagnostic.severity.ERROR] = 'DiagnosticError',
  [vim.diagnostic.severity.WARN] = 'DiagnosticWarn',
  [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
  [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
}

-- Tracks whether we're the ones currently occupying the cmdline, so we only
-- clear it on cursor move if our own diagnostic message is what's shown
-- (otherwise we'd stomp on messages from other plugins, e.g. copy-reference).
local echoed = false

local function echo_line_diagnostic()
  local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
  local diags = vim.diagnostic.get(0, { lnum = lnum })

  if vim.tbl_isempty(diags) then
    if echoed then
      vim.api.nvim_echo({}, false, {})
      echoed = false
    end
    return
  end

  table.sort(diags, function(a, b) return a.severity < b.severity end)
  local d = diags[1]
  local msg = d.message:gsub('\n', ' ')
  vim.api.nvim_echo({ { msg, hl_by_severity[d.severity] } }, false, {})
  echoed = true
end

vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorMoved' }, {
  group = vim.api.nvim_create_augroup('DiagnosticEcho', { clear = true }),
  callback = echo_line_diagnostic,
  desc = 'Echo current line diagnostic in the cmdline (ALE-style, no float)',
})
