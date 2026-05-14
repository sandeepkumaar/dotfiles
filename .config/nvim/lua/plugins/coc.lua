-- NOTE: <c-space> is NOT mapped here — it is used as the tmux prefix.
-- Use <TAB> to trigger completion instead.
return {
  'neoclide/coc.nvim',
  branch = 'release',
  config = function()
    vim.opt.backup = false
    vim.opt.writebackup = false
    vim.opt.updatetime = 300
    vim.opt.signcolumn = 'yes'

    local keyset = vim.keymap.set

    -- Autocomplete
    function _G.check_back_space()
      local col = vim.fn.col('.') - 1
      return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
    end

    local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
    keyset('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
    keyset('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
    keyset('i', '<cr>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

    -- Snippets
    keyset('i', '<c-j>', '<Plug>(coc-snippets-expand-jump)')

    -- Diagnostics navigation
    keyset('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true })
    keyset('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true })

    -- GoTo navigation
    keyset('n', 'gd', '<Plug>(coc-definition)', { silent = true })
    keyset('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
    keyset('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
    keyset('n', 'gr', '<Plug>(coc-references)', { silent = true })

    -- Documentation
    function _G.show_docs()
      local cw = vim.fn.expand('<cword>')
      if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
      elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
      else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
      end
    end
    keyset('n', 'K', '<CMD>lua _G.show_docs()<CR>', { silent = true })

    -- Highlight symbol on CursorHold
    vim.api.nvim_create_augroup('CocGroup', {})
    vim.api.nvim_create_autocmd('CursorHold', {
      group = 'CocGroup',
      command = "silent call CocActionAsync('highlight')",
      desc = 'Highlight symbol under cursor on CursorHold',
    })

    -- Rename
    keyset('n', '<leader>rn', '<Plug>(coc-rename)', { silent = true })

    -- Format
    keyset('x', '<leader>f', '<Plug>(coc-format-selected)', { silent = true })
    keyset('n', '<leader>f', '<Plug>(coc-format-selected)', { silent = true })

    vim.api.nvim_create_autocmd('FileType', {
      group = 'CocGroup',
      pattern = 'typescript,json',
      command = "setl formatexpr=CocAction('formatSelected')",
      desc = 'Setup formatexpr specified filetype(s).',
    })

    -- Code actions
    local nowait_opts = { silent = true, nowait = true }
    keyset('x', '<leader>a', '<Plug>(coc-codeaction-selected)', nowait_opts)
    keyset('n', '<leader>a', '<Plug>(coc-codeaction-selected)', nowait_opts)
    keyset('n', '<leader>ac', '<Plug>(coc-codeaction-cursor)', nowait_opts)
    keyset('n', '<leader>as', '<Plug>(coc-codeaction-source)', nowait_opts)
    keyset('n', '<leader>qf', '<Plug>(coc-fix-current)', nowait_opts)

    -- Refactor
    keyset('n', '<leader>re', '<Plug>(coc-codeaction-refactor)', { silent = true })
    keyset('x', '<leader>r', '<Plug>(coc-codeaction-refactor-selected)', { silent = true })
    keyset('n', '<leader>r', '<Plug>(coc-codeaction-refactor-selected)', { silent = true })

    -- Code lens
    keyset('n', '<leader>cl', '<Plug>(coc-codelens-action)', nowait_opts)

    -- Text objects
    keyset('x', 'if', '<Plug>(coc-funcobj-i)', nowait_opts)
    keyset('o', 'if', '<Plug>(coc-funcobj-i)', nowait_opts)
    keyset('x', 'af', '<Plug>(coc-funcobj-a)', nowait_opts)
    keyset('o', 'af', '<Plug>(coc-funcobj-a)', nowait_opts)
    keyset('x', 'ic', '<Plug>(coc-classobj-i)', nowait_opts)
    keyset('o', 'ic', '<Plug>(coc-classobj-i)', nowait_opts)
    keyset('x', 'ac', '<Plug>(coc-classobj-a)', nowait_opts)
    keyset('o', 'ac', '<Plug>(coc-classobj-a)', nowait_opts)

    -- Scroll float windows
    local scroll_opts = { silent = true, nowait = true, expr = true }
    keyset('n', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', scroll_opts)
    keyset('n', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', scroll_opts)
    keyset('i', '<C-f>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', scroll_opts)
    keyset('i', '<C-b>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', scroll_opts)
    keyset('v', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', scroll_opts)
    keyset('v', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', scroll_opts)

    -- Range select
    keyset('n', '<C-s>', '<Plug>(coc-range-select)', { silent = true })
    keyset('x', '<C-s>', '<Plug>(coc-range-select)', { silent = true })

    -- Commands
    vim.api.nvim_create_user_command('Format', "call CocAction('format')", {})
    vim.api.nvim_create_user_command('Fold', "call CocAction('fold', <f-args>)", { nargs = '?' })
    vim.api.nvim_create_user_command('OR', "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

    -- Statusline
    vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

    -- CocList mappings
    local list_opts = { silent = true, nowait = true }
    keyset('n', '<space>a', ':<C-u>CocList diagnostics<cr>', list_opts)
    keyset('n', '<space>e', ':<C-u>CocList extensions<cr>', list_opts)
    keyset('n', '<space>c', ':<C-u>CocList commands<cr>', list_opts)
    keyset('n', '<space>o', ':<C-u>CocList outline<cr>', list_opts)
    keyset('n', '<space>s', ':<C-u>CocList -I symbols<cr>', list_opts)
    keyset('n', '<space>j', ':<C-u>CocNext<cr>', list_opts)
    keyset('n', '<space>k', ':<C-u>CocPrev<cr>', list_opts)
    keyset('n', '<space>p', ':<C-u>CocListResume<cr>', list_opts)
  end,
}
