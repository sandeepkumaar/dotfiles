return {
  {
    'stevearc/conform.nvim',
    config = function()
      local conform = require('conform')

      conform.setup({
        formatters_by_ft = {
          javascript = { 'prettier' },
          typescript = { 'prettier' },
          json = { 'prettier' },
          yaml = { 'prettier' },
          markdown = { 'prettier' },
          html = { 'prettier' },
          css = { 'prettier' },
          lua = { 'stylua' },
          python = { 'black' },
          go = { 'gofmt' },
          rust = { 'rustfmt' },
        },
      })

      vim.api.nvim_create_user_command('Format', function(opts)
        if opts.range == 2 then
          conform.format({ range = { start = { opts.line1, 0 }, ['end'] = { opts.line2, -1 } } })
        else
          conform.format()
        end
      end, { range = true, desc = 'Format buffer or selection' })

      vim.keymap.set('x', '=', function() conform.format() end, { desc = 'Format selection' })
    end,
  },
}
