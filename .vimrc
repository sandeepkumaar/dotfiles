"Using Native package manager ~/.vim/pack/start/**
"https://shapeshed.com/vim-packages/


"env
set noeb vb t_vb= "no
set novisualbell

"file 
set nowritebackup
set noswapfile
set nobackup
set backspace=indent,eol,start

"indent
set number
set tabstop=2 shiftwidth=2 expandtab
set autoindent
set smartindent
set nowrap
filetype plugin indent on

"select-copy-paste
set clipboard^=unnamed,unnamedplus
"paste-currentindent
nnoremap p ]p 
"paste multiple
xnoremap p pgvy
":C^r "to paste in command mode
set showmatch 
set hls "incremental-highlight search
set incsearch
"allows showmatch on visual selected text. after select do double slash //
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>


" Finding files
set path+=**
set wildmenu 
set wildmode=full
set wildignore+=**/node_modules/**

" netrw config
let g:netrw_liststyle= 0 
let g:netrw_banner = 0
":E  open current directory 
"d, D delete and create directory 
"R rename
"% create file

"theme
syntax on 
" Nord setting
"set background=dark
"colorscheme nord

" Settings for pablo colorscheme
colorscheme pablo
set t_Co=256
set background=dark
"" **Make vim to take the terminal background**
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

""""""" ALE Linters
packadd ale
let g:ale_enabled = 1
let g:ale_linters_explicit = 1
let g:ale_virtualtext_cursor = 'disabled'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_sign_column_always = 0
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
"let g:ale_javascript_eslint_use_global = 1
let g:ale_disable_lsp = 1
"""""""

""""""" COC.vim
packadd coc.nvim
source ~/.vim/coc.vimrc
"ctrl + k for function signature
"highlight CocFloating ctermbg=lightgray ctermfg=darkgray guibg=#D3D3D3 guifg=#A9A9A9
inoremap <silent> <C-k> <C-r>=CocActionAsync('showSignatureHelp')<CR>
"coc-go options
"import on save
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
""""""""

""""""" Window management
" split panes vertically, Left be the main file. Right be the imported files
" Ctrl-w // switch windows

" File navigation
" :b ; :fin ; <tab> to search files;<Ctrl-e> to select the tabbed path
" <Ctrl-^> // switch between buffers
"""""""

""""""" Code navigation
" Use gf to go to imported files

" Auto-complete 
" ^x^f auto-complete path; ^n, ^p move suggestion 
" ^n; ^x^n autocomplete word; within file
" ^e to discard autocomplete
""""""""
