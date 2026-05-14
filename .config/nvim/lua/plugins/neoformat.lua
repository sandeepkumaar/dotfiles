return {
  'sbdchd/neoformat',
  config = function()
    vim.g.neoformat_enabled_javascript = {'prettier'}
    vim.g.neoformat_enabled_json = {'prettier'}
    vim.g.neoformat_enabled_typescript = {'prettier'}
  end
}
