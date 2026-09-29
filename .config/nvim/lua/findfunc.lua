local M = {}

function M.find(cmdarg, _)
  local dir = vim.fn.fnamemodify(cmdarg, ':h')
  local name = vim.fn.fnamemodify(cmdarg, ':t')

  local pattern = name
  if not pattern:find('[*?]') then
    pattern = '*' .. pattern .. '*'
  end

  local cmd = {
    'fd', '--type', 'f', '--hidden',
    '--exclude', '.git', '--glob', pattern,
  }
  if dir ~= '.' then
    table.insert(cmd, '--search-path')
    table.insert(cmd, dir)
  end

  local results = vim.fn.systemlist(cmd)
  if vim.v.shell_error ~= 0 then
    return {}
  end
  return results
end

return M
