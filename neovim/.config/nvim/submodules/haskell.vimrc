"  Tabular
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
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

let g:ale_linters = {}
let g:ale_linters.haskell = ['ghc', 'hlint']
let g:ale_haskell_ghc_options = '
      \ -threaded
      \ -rtsopts
      \ -with-rtsopts=-N
      \ -Wall
      \ -Wcompat
      \ -Wincomplete-record-updates
      \ -Wincomplete-uni-patterns
      \ -Wredundant-constraints
      \ -Wmissing-import-lists
      \ -Wmissing-export-lists
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
