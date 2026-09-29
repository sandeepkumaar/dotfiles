" =============================================================================
" og - a dark colourscheme derived from vim's pablo
" =============================================================================
"
" HOW THIS FILE WORKS
"
"   1. PALETTE   - every colour is named once, in s:p below. Each entry is
"                  ['#rrggbb', <256-colour index>]. Change a hex there and
"                  every group using that name follows.
"   2. s:hi()    - small helper so each group is one readable line:
"
"                     call s:hi('Group', <fg>, <bg>, <attr>[, <sp>])
"
"                  <fg>/<bg>/<sp> are palette NAMES from s:p, or '' for NONE.
"                  <attr> is '' (none), 'bold', 'underline', 'reverse',
"                  'undercurl', or a comma list like 'bold,underline'.
"                  The helper fills in gui* and cterm* for you; 'undercurl'
"                  automatically becomes 'underline' for cterm, which has no
"                  undercurl.
"   3. GROUPS     - organised in sections: editor chrome first, then syntax,
"                  then diffs/spelling, then markdown, then links.
"
" TO RETINT ONE THING     find its `call s:hi(...)` line and swap the palette
"                         name (e.g. 'blue' -> 'cyan').
" TO RETINT EVERYWHERE    change the hex in s:p.
" TO SEE WHAT A GROUP IS  put the cursor on some text and run :Inspect
"                         (:Inspect shows the treesitter capture AND the
"                         highlight group actually painting it).
"
" NOTE ON 'termguicolors'
"   With termguicolors ON  (your setting) the '#rrggbb' values are used.
"   With it OFF the 256-colour indices are used instead. Both are defined for
"   every group here, and they are kept consistent - unlike upstream pablo,
"   where a few groups disagreed (its Title was #ff00ff in gui but a pale pink
"   225 in cterm, so headings looked washed out with termguicolors off).
"
" Derived from: pablo by Ron Aaron, via vim/colorschemes.
" =============================================================================

set background=dark

hi clear
let g:colors_name = 'og'

" =============================================================================
" 1. PALETTE
" =============================================================================
" name              gui        cterm   used for
let s:p = {
      \ 'fg':        ['#ffffff', 231],
      \ 'bg':        ['#000000', 16],
      \
      \ 'grey':      ['#808080', 244],
      \ 'grey_dim':  ['#666666', 241],
      \ 'grey_ui':   ['#7f7f7f', 102],
      \ 'silver':    ['#c6c6c6', 251],
      \ 'white_dim': ['#e5e5e5', 254],
      \ 'divider':   ['#a9a9a9', 248],
      \
      \ 'panel':     ['#303030', 236],
      \ 'float':     ['#16161e', 233],
      \ 'float_sel': ['#24242e', 235],
      \ 'line':      ['#3a3a3a', 237],
      \ 'column':    ['#4d4d4d', 239],
      \
      \ 'cyan':      ['#00ffff', 51],
      \ 'cyan_dark': ['#00c0c0', 37],
      \ 'cyan_deep': ['#008b8b', 30],
      \ 'cyan_mid':  ['#00cdcd', 44],
      \
      \ 'green':     ['#00ff00', 46],
      \ 'green_dark':['#00c000', 34],
      \ 'green_diff':['#5f875f', 65],
      \
      \ 'yellow':    ['#ffff00', 226],
      \ 'yellow_dim':['#d7d700', 184],
      \ 'olive':     ['#c0c000', 142],
      \
      \ 'blue':      ['#005fff', 27],
      \ 'blue_deep': ['#0000ff', 21],
      \ 'blue_bar':  ['#0000ee', 20],
      \ 'blue_soft': ['#5c5cff', 63],
      \ 'blue_pale': ['#80a0ff', 111],
      \ 'blue_diff': ['#5f87af', 67],
      \ 'navy':      ['#00008b', 18],
      \
      \ 'pink':      ['#ff00ff', 201],
      \ 'magenta':   ['#cd00cd', 164],
      \ 'orchid':    ['#af5faf', 133],
      \
      \ 'red':       ['#ff0000', 196],
      \ 'red_dark':  ['#cd0000', 160],
      \ }
" Colour roles at a glance:
"   fg/greys ... text and chrome        cyan ....... constants, strings
"   cyan_dark .. identifiers, functions yellow_dim . keywords
"   green ...... preprocessor           green_dark . types, directories
"   blue ....... Special, escapes       pink ....... titles
"   red ........ errors                 olive ...... search, TODO

" =============================================================================
" 2. HELPER
" =============================================================================
function! s:hi(group, fg, bg, attr, ...) abort
  let l:sp = a:0 > 0 ? a:1 : ''
  let l:gui = a:attr ==# '' ? 'NONE' : a:attr
  " cterm has no undercurl - fall back to a plain underline
  let l:cterm = substitute(l:gui, 'undercurl', 'underline', 'g')
  execute 'hi' a:group
        \ 'guifg=' . (a:fg ==# '' ? 'NONE' : s:p[a:fg][0])
        \ 'guibg=' . (a:bg ==# '' ? 'NONE' : s:p[a:bg][0])
        \ 'guisp=' . (l:sp ==# '' ? 'NONE' : s:p[l:sp][0])
        \ 'gui='   . l:gui
        \ 'ctermfg=' . (a:fg ==# '' ? 'NONE' : s:p[a:fg][1])
        \ 'ctermbg=' . (a:bg ==# '' ? 'NONE' : s:p[a:bg][1])
        \ 'cterm='   . l:cterm
endfunction

" =============================================================================
" 3. EDITOR - text and background
" =============================================================================
"                    group          fg           bg         attr
call s:hi('Normal',       'fg',         'bg',      '')
call s:hi('Ignore',       'bg',         'bg',      '')
call s:hi('Conceal',      'grey_dim',   '',        '')
call s:hi('NonText',      'blue_deep',  '',        'bold')
call s:hi('EndOfBuffer',  'blue_deep',  '',        'bold')
call s:hi('SpecialKey',   'cyan',       '',        '')
call s:hi('Directory',    'green_dark', '',        '')
call s:hi('Title',        'pink',       '',        'bold')

" =============================================================================
" 4. EDITOR - cursor and current line
" =============================================================================
call s:hi('Cursor',       'bg',         'fg',      '')
call s:hi('lCursor',      'bg',         'fg',      '')
call s:hi('CursorIM',     '',           'fg',      '')
call s:hi('CursorLine',   '',           'line',    '')
call s:hi('CursorColumn', '',           'line',    '')
call s:hi('CursorLineNr', 'yellow',     'line',    'bold')
call s:hi('ColorColumn',  '',           'column',  '')

" =============================================================================
" 5. EDITOR - gutter (line numbers, signs, folds)
" =============================================================================
call s:hi('LineNr',       'grey_ui',    '',        '')
call s:hi('SignColumn',   'cyan',       'divider', '')
call s:hi('Folded',       'grey_ui',    'panel',   '')
call s:hi('FoldColumn',   'grey_ui',    'panel',   '')

" =============================================================================
" 6. EDITOR - windows, status line, tabs
" =============================================================================
call s:hi('VertSplit',    'bg',         'fg',      '')
call s:hi('StatusLine',   'yellow',     'blue_bar','')
call s:hi('StatusLineNC', 'bg',         'fg',      '')
call s:hi('TabLine',      'fg',         'grey_ui', '')
call s:hi('TabLineSel',   'fg',         'bg',      'bold')
call s:hi('TabLineFill',  '',           'bg',      'reverse')
call s:hi('ToolbarLine',  '',           'bg',      '')
call s:hi('ToolbarButton','bg',         'white_dim','bold')

" =============================================================================
" 7. EDITOR - completion popup
" =============================================================================
call s:hi('Pmenu',         'fg',        'float',     '')
call s:hi('PmenuSel',      'fg',        'float_sel', 'bold')
call s:hi('PmenuKind',     'cyan_dark', '',          '')
call s:hi('PmenuKindSel',  'cyan_dark', 'float_sel', 'bold')
call s:hi('PmenuExtra',    'grey',      '',          '')
call s:hi('PmenuExtraSel', 'grey',      'float_sel', 'bold')
call s:hi('PmenuMatch',    'pink',      '',          '')
call s:hi('PmenuMatchSel', 'pink',      'float_sel', 'bold')
call s:hi('PmenuSbar',     '',          '',          '')
call s:hi('PmenuThumb',    '',          'grey_dim',  '')
call s:hi('WildMenu',      'bg',        'yellow',    '')
call s:hi('NormalFloat',   'fg',        'panel',     '')
call s:hi('FloatBorder',   'grey_dim',  'panel',     '')

" =============================================================================
" 8. EDITOR - search, selection, matching
" =============================================================================
call s:hi('Search',       'bg',   'olive',    '')
call s:hi('IncSearch',    'fg',   '',         'reverse')
call s:hi('MatchParen',   '',     'cyan_deep','')
call s:hi('Visual',       'navy', 'divider',  '')
call s:hi('VisualNOS',    '',     'bg',       'bold,underline')
call s:hi('QuickFixLine', 'bg',   'cyan_mid', '')

" =============================================================================
" 9. EDITOR - messages and prompts
" =============================================================================
call s:hi('ModeMsg',    '',        '',       'bold')
call s:hi('MoreMsg',    'blue_soft','',      'bold')
call s:hi('Question',   'green',   '',       'bold')
call s:hi('WarningMsg', 'red',     '',       '')
call s:hi('ErrorMsg',   'fg',      'red_dark','')

" =============================================================================
" 10. SYNTAX
" =============================================================================
" These eight groups drive almost all code colouring. Most language-specific
" groups and treesitter captures fall back to one of them, so retinting a
" single line here changes that role everywhere, in every filetype.
"
call s:hi('Comment',    'grey',       '', '')      " // comments
call s:hi('Constant',   'cyan',       '', '')      " strings, numbers, booleans
call s:hi('Identifier', 'cyan_dark',  '', '')      " variables, functions
call s:hi('Statement',  'yellow_dim', '', 'bold')  " if, for, return, keywords
call s:hi('PreProc',    'green',      '', '')      " #include, import
call s:hi('Type',       'green_dark', '', '')      " int, class, struct
call s:hi('Special',    'blue',       '', '')      " escapes, punctuation, tags
call s:hi('Underlined', 'blue_pale',  '', 'underline')

" Flagged text
call s:hi('Error', 'fg', 'red',   '')
call s:hi('Todo',  'bg', 'olive', '')

" =============================================================================
" 11. DIFFS
" =============================================================================
call s:hi('DiffAdd',    'fg', 'green_diff', '')
call s:hi('DiffChange', 'fg', 'blue_diff',  '')
call s:hi('DiffDelete', 'fg', 'orchid',     '')
call s:hi('DiffText',   'bg', 'silver',     '')

" =============================================================================
" 12. SPELLING
" =============================================================================
"                    group        fg          bg  attr         sp (curl colour)
call s:hi('SpellBad',   'red',       '', 'undercurl', 'red')
call s:hi('SpellCap',   'blue_soft', '', 'undercurl', 'blue_soft')
call s:hi('SpellLocal', 'pink',      '', 'undercurl', 'pink')
call s:hi('SpellRare',  'yellow',    '', 'undercurl', 'yellow')

" =============================================================================
" 13. LSP DIAGNOSTICS
" =============================================================================
call s:hi('DiagnosticError',            'red',        '',         '')
call s:hi('DiagnosticWarn',             'yellow',     '',         '')
call s:hi('DiagnosticInfo',             'blue_soft',  '',         '')
call s:hi('DiagnosticHint',             'cyan',       '',         '')
call s:hi('DiagnosticUnderlineError',   '',           '',         'undercurl', 'red')
call s:hi('DiagnosticUnderlineWarn',    '',           '',         'undercurl', 'yellow')
call s:hi('DiagnosticUnderlineInfo',    '',           '',         'undercurl', 'blue_soft')
call s:hi('DiagnosticUnderlineHint',    '',           '',         'undercurl', 'cyan')
call s:hi('DiagnosticVirtualTextError', 'red',        'panel',    '')
call s:hi('DiagnosticVirtualTextWarn',  'yellow',     'panel',    '')
call s:hi('DiagnosticVirtualTextInfo',  'blue_soft',  'panel',    '')
call s:hi('DiagnosticVirtualTextHint',  'cyan',       'panel',    '')
call s:hi('DiagnosticFloatingError',    'red',        'panel',    'bold')
call s:hi('DiagnosticFloatingWarn',     'yellow',     'panel',    'bold')
call s:hi('DiagnosticFloatingInfo',     'blue_soft',  'panel',    'bold')
call s:hi('DiagnosticFloatingHint',     'cyan',       'panel',    'bold')

" =============================================================================
" 14. MARKDOWN
" =============================================================================
" Neovim resolves several markdown captures to Special, so with pablo's blue
" Special the result was inline code, unlabelled code fences, blockquotes, list
" markers and table pipes ALL in one solid blue - most of a README. These
" overrides spread that across roles instead.
"
" The group names carry a `.markdown` / `.markdown_inline` suffix, which
" Neovim's treesitter highlighter prefers over the bare capture name. That
" scopes them to markdown only: javascript and every other filetype still get
" plain Special (blue) from section 10.
"
" Run :Inspect on any markdown text to see which of these is painting it.
"
" `inline code` - short and sparse, so an accent is fine
call s:hi('@markup.raw.markdown_inline', 'cyan', '', '')
" fenced block bodies with no language (or no parser) - bulk text, keep quiet
call s:hi('@markup.raw.block.markdown', 'fg', '', '')
" > blockquotes
call s:hi('@markup.quote.markdown', 'green_dark', '', '')
" - list markers (the bullet only, not the item text)
call s:hi('@markup.list.markdown', 'yellow_dim', '', '')
" table pipes, ``` fences, backticks - structure, not content
call s:hi('@punctuation.special.markdown', 'grey', '', '')
call s:hi('@markup.raw.delimiter.markdown', 'grey', '', '')
call s:hi('@markup.raw.delimiter.markdown_inline', 'grey', '', '')

" Headings. Pablo's Title (#ff00ff) is searing on black, so these use the two
" softer magentas: 'magenta' for the H1 document title, 'orchid' for H2-H6,
" which are the frequent ones. For the original hot pink use 'pink' instead.
" The unlevelled group comes first - Neovim tags TABLE HEADER cells with it,
" as well as setext-style (underlined) headings.
call s:hi('@markup.heading.markdown',   'blue',  '', 'bold')
call s:hi('@markup.heading.1.markdown', 'blue', '', 'bold')
call s:hi('@markup.heading.2.markdown', 'blue',  '', 'bold')
call s:hi('@markup.heading.3.markdown', 'blue',  '', 'bold')
call s:hi('@markup.heading.4.markdown', 'blue',  '', 'bold')
call s:hi('@markup.heading.5.markdown', 'blue',  '', 'bold')
call s:hi('@markup.heading.6.markdown', 'blue',  '', 'bold')

" =============================================================================
" 15. LINKS
" ============================================================================="
" Groups that simply borrow another group's colours. This is how one syntax
" role covers many groups - e.g. Function follows Identifier, so recolouring
" Identifier in section 10 moves function names too.
hi! link Number            Constant
hi! link Float             Number
hi! link Function          Identifier
hi! link CurSearch         Search
hi! link CursorLineFold    CursorLine
hi! link CursorLineSign    CursorLine
hi! link LineNrAbove       LineNr
hi! link LineNrBelow       LineNr
hi! link MessageWindow     Pmenu
hi! link BlinkCmpDoc       Pmenu
hi! link BlinkCmpDocBorder Pmenu
hi! link PopupNotification Todo
hi! link StatusLineTerm    StatusLine
hi! link StatusLineTermNC  StatusLineNC
hi! link TabPanel          Normal
hi! link TabPanelFill      EndOfBuffer
hi! link Terminal          Normal

" =============================================================================
" 16. :terminal ANSI PALETTE
" =============================================================================
" The 16 colours programs run inside :terminal use. Only applies when
" 'termguicolors' is on; otherwise your terminal emulator's own theme is used.
let g:terminal_ansi_colors = [
      \ '#000000', '#cd0000', '#00cd00', '#cdcd00',
      \ '#0000ee', '#cd00cd', '#00cdcd', '#e5e5e5',
      \ '#7f7f7f', '#ff0000', '#00ff00', '#ffff00',
      \ '#5c5cff', '#ff00ff', '#00ffff', '#ffffff',
      \ ]

delfunction s:hi

" vim: et ts=8 sw=2 sts=2
