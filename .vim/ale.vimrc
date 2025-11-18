
""""""" ALE Linters
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
""""""""
