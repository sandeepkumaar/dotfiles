return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
    config = function()
      local cmp = require('cmp')

      -- Dim the [TS], [BUF] etc (after colorscheme loads)
      vim.api.nvim_create_autocmd('ColorScheme', {
        callback = function()
          vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = '#808080' })
        end,
      })
      vim.schedule(function()
        vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = '#808080' })
      end)

      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
      end

      cmp.setup({
        formatting = {
          format = function(entry, vim_item)
            -- Show kind as single letter (like coc)
            local kind_icons = {
              Text = 'T',
              Method = 'f',
              Function = 'f',
              Constructor = 'C',
              Field = 'F',
              Variable = 'v',
              Class = 'c',
              Interface = 'i',
              Module = 'M',
              Property = 'P',
              Unit = 'U',
              Value = 'V',
              Enum = 'E',
              Keyword = 'K',
              Snippet = 'S',
              Color = 'C',
              File = 'F',
              Reference = 'R',
              Folder = 'D',
              EnumMember = 'E',
              Constant = 'C',
              Struct = 'S',
              Event = 'E',
              Operator = 'O',
              TypeParameter = 'T',
            }

            vim_item.kind = kind_icons[vim_item.kind] or vim_item.kind

            -- Show language (like coc: [TS], [JS], [BUF], [PATH])
            local source_menu = {
              nvim_lsp = (function()
                local ft = vim.bo.filetype
                local ft_map = {
                  typescript = 'TS',
                  typescriptreact = 'TSX',
                  javascript = 'JS',
                  javascriptreact = 'JSX',
                  json = 'JSON',
                  lua = 'LUA',
                  python = 'PY',
                  go = 'GO',
                  rust = 'RS',
                  yaml = 'YAML',
                  html = 'HTML',
                  css = 'CSS',
                }
                return '[' .. (ft_map[ft] or ft:upper()) .. ']'
              end)(),
              buffer = '[BUF]',
              path = '[PATH]',
              nvim_lua = '[LUA]',
            }
            vim_item.menu = source_menu[entry.source.name]

            return vim_item
          end,
        },
        window = {
          completion = cmp.config.window.bordered({
            border = 'none',
            winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder',
          }),
          documentation = cmp.config.window.bordered({
            border = 'none',
            winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder',
          }),
        },
        performance = {
          max_view_entries = 10,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        }),
        completion = {
          autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
        },
      })

      -- JavaScript/TypeScript: disable auto-trigger (suggest.autoTrigger: "none")
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
        callback = function()
          cmp.setup.buffer({
            completion = {
              autocomplete = {},  -- Manual trigger via Ctrl-Space only
            },
          })
        end,
      })
    end,
  },
}
