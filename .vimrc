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
set clipboard=unnamed
"paste-currentindent
nnoremap p ]p 
"paste multiple
xnoremap p pgvy
":C^r "to paste in command mode
set showmatch 
set hls "incremental-highlight search
set incsearch
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
let loaded_matchparen = 1 "disable highlight matchparenthesis

" netrw config
let g:netrw_liststyle= 0 
let g:netrw_banner = 0
":E  open current directory 
"d, D delete and create directory 
"R rename
"% create file

"theme
syntax on 
set background=dark
colorscheme nord
" Settings for pablo colorscheme
"colorscheme pablo
"set t_Co=256
" **Make vim to take the terminal background**
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE

" ALE Linters



" Window management
" split panes vertically, Left be the main file. Right be the imported files
" Ctrl-w // switch windows

" File navigation
" :b ; :fin ; <tab> to search files;<Ctrl-e> to select the tabbed path
" <Ctrl-^> // switch between buffers



" Code navigation
" Use gf to go to imported files

" Auto-complete 
" ^x^f auto-complete path; ^n, ^p move suggestion 
" ^n; ^x^n autocomplete word; within file
" ^e to discard autocomplete
