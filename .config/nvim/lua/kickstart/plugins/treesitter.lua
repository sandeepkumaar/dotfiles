--return { -- Highlight, edit, and navigate code
--  'nvim-treesitter/nvim-treesitter',
--  build = ':TSUpdate',
--  main = 'nvim-treesitter',
--  opts = {
--    ensure_installed = {
--      'bash',
--      'c',
--      'diff',
--      'html',
--      'lua',
--      'luadoc',
--      'markdown',
--      'markdown_inline',
--      'query',
--      'vim',
--      'vimdoc',
--      'typescript',
--      'javascript',
--      'tsx',
--      'jsx',
--    },
--    auto_install = true,
--    highlight = {
--      enable = true,
--      additional_vim_regex_highlighting = true
--    }
--  },
--}
return  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    branch = 'main',
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter-intro`
    config = function()
      local parsers = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'javascript' }
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

          -- treesitter indentation disabled: using filetype indent scripts instead
          -- (same behaviour as vim's filetype plugin indent on)
        end,
      })
    end,
}
