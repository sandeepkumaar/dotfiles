return { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter-intro`
    config = function()
      -- lua, markdown, markdown_inline, query, vimdoc are bundled with Neovim 0.12+
      -- and already auto-attached by core's own ftplugins, so we only manage
      -- the parsers core doesn't ship or auto-attach.
      local parsers = { 'bash', 'c', 'diff', 'html', 'luadoc', 'vim', 'javascript', 'typescript' }
      require('nvim-treesitter').install(parsers)
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local buf, filetype = args.buf, args.match

          local language = vim.treesitter.language.get_lang(filetype)
          if not language then return end

          -- check if parser exists and load it
          if not vim.treesitter.language.add(language) then return end
          -- enables syntax highlighting and other treesitter features
          vim.treesitter.start(buf, language)

          -- enables treesitter based folds
          -- for more info on folds see `:help folds`
          -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          -- vim.wo.foldmethod = 'expr'

          -- enables treesitter based indentation
          -- (skip javascript: its treesitter indent queries are still experimental
          -- and worse than the built-in vim-javascript indentexpr)
          if filetype ~= 'javascript' then
            vim.bo[buf].indentexpr = 'v:lua.vim.treesitter.indentexpr()'
          end
        end,
      })
    end,
}
