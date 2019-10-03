 
source ~/.vimrc.bundles

"file 
set nowritebackup
set noswapfile
set nobackup

"indent
set number
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set nowrap

"select-copy-paste
set clipboard=unnamedplus
"paste-currentindent
nnoremap p ]p 
set noshowmatch "use % to find closing brackets 
let loaded_matchparen = 1

" Finding files
set path+=**
set wildmenu 
set wildignore+=**/node_modules/**

" netrw config
let g:netrw_liststyle= 3
let g:netrw_banner = 0
":E  open current directory 
"d, D delete and create directory 
"R rename


"theme
syntax on 
set background=dark
colorscheme pablo 

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
" 
