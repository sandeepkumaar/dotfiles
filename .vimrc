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

""""""" COC.vim
packadd coc.nvim
source ~/.vim/coc.vimrc
"""""""
packadd ale
source ~/.vim/ale.vimrc

"indent
set number
set tabstop=2        " A tab character displays as 2 spaces
set softtabstop=2    " Pressing <Tab> or <BS> adds/removes 2 spaces
set shiftwidth=2     " Indentation with >> or << is 2 spaces
set expandtab        " Replaces tabs with spaces
set autoindent
set smartindent
set nowrap
set foldmethod=syntax
set foldlevel=1000
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

"""""""""""""""""""""""""
"To avoid overuse of left pinky
""""""""""""""""""""""""
" Set space as the leader key
let mapleader = " "
nnoremap <Space> <Nop>
" switch tabs
nnoremap <leader>ww <C-w>w
" alternate buffer
nnoremap <leader>- <C-^>
" switch to terminal
nnoremap <leader>z <C-z>
" write file
nnoremap <leader>w :w<CR>
" quit file
nnoremap <leader>q :q<CR>
" Explorer
nnoremap <leader>e :Ex<CR>
" Split
nnoremap <leader>vs :vs<CR>

" Insert mode: Ctrl + s to save and return to normal mode
inoremap <C-s> <Esc>:w<CR>

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

" Settings for pablo colorscheme
colorscheme pablo
set t_Co=256
set background=dark
"" **Make vim to take the terminal background**
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" Hack for vim freeze in mac for typescript files
set re=2




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
