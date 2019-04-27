"  Tabular
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a: :Tabularize /::<CR>
vmap a, :Tabularize /,<CR>
vmap a- :Tabularize /-><CR>

" Align 'then' two spaces after 'if'
let g:haskell_indent_if = 2
" Indent 'where' block two spaces under previous body
let g:haskell_indent_before_where = 2
" Allow a second case indent style (see haskell-vim README)
let g:haskell_indent_case_alternative = 1
" Only next under 'let' if there's an equals sign
let g:haskell_indent_let_no_in = 0

" Indenting on save is too aggressive for me
let g:stylishask_on_save = 0

" Helper function, called below with mappings
function! HaskellFormat(which) abort
  if a:which ==# 'stylish' || a:which ==# 'both'
    silent! exe 'undojoin'
    silent! exe 'keepjumps %!stylish-haskell'
  endif
endfunction

" Key bindings
augroup haskellStylish
  au!
  " Just stylish-haskell
  au FileType haskell nnoremap <leader>hf :call HaskellFormat('stylish')<CR>
augroup END

" ----- w0rp/ale -----

au FileType haskell nnoremap <buffer> <silent> <F2> :ALEDetail<CR>

let g:ale_linters = {}
let g:ale_linters.haskell = ['stack_ghc', 'hlint']
let g:ale_fixers = {'haskell': ['brittany', 'hlint']}
let g:ale_haskell_stack_ghc_options = '
      \ -threaded
      \ -rtsopts
      \ -with-rtsopts=-N
      \ -Wall
      \ -Wcompat
      \ -Wincomplete-record-updates
      \ -Wincomplete-uni-patterns
      \ -Wredundant-constraints
      \'

" Ctrl-{hjkl} for navigating out of terminal panes
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" ---- ghcid -----
let g:ghcid_command = 'stack exec ghcid --'

augroup ghcidMaps
  au!
  au FileType haskell nnoremap <silent> <leader>go :Ghcid<CR>
  au FileType haskell nnoremap <silent> <leader>gov :Ghcid<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>gk :GhcidKill<CR>
augroup END

" ------ hdevtools -------
" let g:hdevtools_stack = 1
" let g:hdevtools_options = '-g -fdefer-type-errors -g -isrc -g -Wall'

" au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
" au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsInfo<CR>
" au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsClear<CR>

" ----- haskell-vim ------
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
