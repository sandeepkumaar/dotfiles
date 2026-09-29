vim.o.number = true
vim.o.mouse = 'a'
vim.o.showmode = false

-- Tabs & Indents 
vim.o.expandtab = true -- use spaces for tabs
vim.o.tabstop = 2 -- use 2 spaces for a tab
vim.o.softtabstop = 2 -- use 2 spaces for a tab in insert mode
vim.o.shiftwidth = 2 -- use 2 spaces when >> or << 
vim.o.smartindent = true -- indent to a newline based on code
vim.opt.copyindent = true -- preserve indent when copied from a diff place
vim.opt.preserveindent = true -- preserve indent on newline

vim.o.wrap = true -- wrap long lines and follow indents
vim.o.breakindent = true -- wrapped lines follow the indentation instead to start from margin
vim.o.linebreak = true -- no word break


-- Settings
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
vim.o.undofile = true -- persist undo after file close
vim.o.updatetime = 250 -- time to trigger completions, errors 
vim.o.timeoutlen = 300 -- key combos wait time
vim.o.confirm = true -- ask for confirmation in the event of any failures
vim.o.splitright = true
vim.o.splitbelow = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = 'split' -- highlight text on search & replace
vim.o.findfunc = "v:lua.require'findfunc'.find" -- use fd for :find
vim.o.grepprg = 'rg --vimgrep --smart-case' -- use ripgrep for :grep

-- Cursor
vim.opt.guicursor = 'n-v-c:block,i:block'
vim.o.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.

-- Wildmenu
vim.opt.path:append('**')
vim.opt.wildoptions:remove('pum') -- wildmenu shows horizontally
vim.opt.wildignore:append('**/node_modules/**')


-- Netrw
vim.g.netrw_liststyle = 0
vim.g.netrw_banner = 0

-- Colorscheme
vim.o.termguicolors = true
vim.cmd 'colorscheme og'
vim.cmd [[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
]] -- takes terminal's background instead of vim's dark bg

-- StatusLine: At the bottom we have 2 sections. CommandLine, StatusLine. Option 2 - provides a dedicated statusline on single, splits
vim.opt.laststatus = 2 -- default. we 
vim.opt.statusline = "%{fnamemodify(expand('%'), ':~:.')}" -- relative path from working directory
