-- ALE Linters
vim.g.ale_enabled = 1
vim.g.ale_disable_lsp = 1
vim.g.ale_virtualtext_cursor = 'disabled'
vim.g.ale_linters_explicit = 1
vim.g.ale_set_highlights = true
vim.g.ale_set_signs = false
vim.opt.signcolumn = "number"

vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE', ctermbg = 'NONE' })

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = ">>", -- Symbol for Error
            [vim.diagnostic.severity.WARN]  = "--", -- Symbol for Warning
            [vim.diagnostic.severity.INFO] = "--", -- Symbol for Error
        },
    },
    underline = false,
})
