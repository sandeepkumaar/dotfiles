return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { 'ts_ls', 'jsonls' },
        automatic_installation = true,
      })

      local on_attach = function(client, bufnr)
        require('lsp-keymaps').setup(bufnr)
        -- Disable semantic tokens to use treesitter-only highlighting (matches original)
        client.server_capabilities.semanticTokensProvider = nil
      end

      vim.lsp.config('ts_ls', {
        cmd = { 'typescript-language-server', '--stdio' },
        root_markers = { 'tsconfig.json', 'jsconfig.json', '.git' },
        on_attach = on_attach,
      })

      vim.lsp.config('jsonls', {
        cmd = { 'vscode-json-languageserver', '--stdio' },
        root_markers = { '.git' },
        on_attach = on_attach,
      })

      vim.lsp.enable({ 'ts_ls', 'jsonls' })
    end,
  },
}
